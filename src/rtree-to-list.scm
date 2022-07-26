;;;; Copyright (C) 2021  Otto Jung
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

%use (node? node-id node-children set-node-children! node-label node-namespace) "./node.scm"
%use (rtree rtree? rtree-ref set-rtree-ref! rtree-value rtree-children) "./euphrates/rtree.scm"
%use (make-hashmap hashmap-ref hashmap-set! hashmap->alist) "./euphrates/ihashmap.scm"
%use (cons!) "./euphrates/cons-bang.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (fp) "./euphrates/fp.scm"
%use (~a) "./euphrates/tilda-a.scm"
%use (keyword-let) "./keyword-let.scm"
%use (exp-node?) "./exp-node-huh.scm"

(define (rtree->list tree)
  (define all-references
    (let loop ((tree tree))
      (if (rtree? tree)
          (if (or (rtree-ref tree) (null? (rtree-children tree)))
              (cons
               (cons (rtree-value tree)
                     (cons (rtree-ref tree) (rtree-children tree)))
               (apply append (map loop (rtree-children tree))))
              (apply append (map loop (rtree-children tree))))
          '())))

  (define (dereference T)
    (let loop ((T T))
      (cond
       ((vector? T)
        (get-label (rtree-value (vector-ref T 0))))
       ((rtree? T)
        (if (or (rtree-ref T) (null? (rtree-children T)))
            (get-label (rtree-value T))
            (map loop (rtree-children T))))
       (else (raisu 'Unknown-type-in-dereference T)))))

  (define (tuple-to-binding ref)
    (define key (car ref))
    (define referenced? (cadr ref))
    (define value (cddr ref))
    (list (get-label key) (map dereference value)))

  (define node->name-map (make-hashmap))
  (define name->node-map (make-hashmap))

  (define (get-label node)
    (hashmap-ref node->name-map (node-id node) 'label-not-found))

  (define counter 0)

  (define _0
    (for-each
     (lambda (p)
       (define node (car p))
       (define existing (hashmap-ref name->node-map (node-label node) #f))

       (define name-info
         (if existing
             (string->symbol
              (string-append
               (symbol->string (node-label node)) "." (~a (node-namespace node))))
             (if (exp-node? node)
                 (begin
                   (set! counter (+ 1 counter))
                   (string->symbol (string-append "$" (~a counter))))
                 (node-label node))))

       (hashmap-set! name->node-map name-info (node-id node))
       (hashmap-set! node->name-map (node-id node) name-info))
     all-references))

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            all-references))

  (define body
    (dereference tree))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple-to-binding useful-refs) (list body)))))
