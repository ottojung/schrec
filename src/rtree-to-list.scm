;;;; Copyright (C) 2021, 2022  Otto Jung
;;;;
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation; version 3 of the License.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

%run guile

%var rtree->list

%use (fp) "./euphrates/fp.scm"
%use (hashmap-ref hashmap-set! make-hashmap) "./euphrates/ihashmap.scm"
%use (~a) "./euphrates/tilda-a.scm"
%use (exp-node?) "./exp-node-huh.scm"
%use (keyword-let) "./keyword-let.scm"
%use (node-display node-id node-label node-namespace set-node-display!) "./node.scm"
%use (rtree-references) "./rtree-references.scm"
%use (rtree-substitute-labels) "./rtree-substitute-labels.scm"

(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define name->node-map (make-hashmap))

  (define (get-label node)
    (or (node-display node)
        (node-label node)))
  (define (subs T)
    (rtree-substitute-labels T))

  (define (tuple-to-binding ref)
    (define key (car ref))
    (define referenced? (cadr ref))
    (define value (cddr ref))
    (list (get-label key) (map subs value)))

  (define counter 0)

  (define potential-refs
    (filter (fp (ref referenced? . children)
                (or referenced?
                    (null? children)))
            all-references))

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            potential-refs))

  (define (get-display existing node)
    (if (< 0 existing)
        (string->symbol
         (string-append
          (symbol->string (node-label node)) "." (~a (node-namespace node))))
        (if (exp-node? node)
            (begin
              (set! counter (+ 1 counter))
              (string->symbol (string-append "$" (~a counter))))
            (node-label node))))

  (define _0
    (for-each
     (lambda (p)
       (define node (car p))
       (define referenced? (cadr p))
       (define localid (if (exp-node? node) (node-id node) (node-label node)))
       (define existing (hashmap-ref name->node-map localid 0))
       (hashmap-set! name->node-map localid (+ 1 existing))

       (define name-info
         (get-display existing node))

       (set-node-display! node name-info))
     potential-refs))

  (define body
    (subs tree))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple-to-binding useful-refs) (list body)))))
