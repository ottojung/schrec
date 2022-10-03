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
%use (exp-node?) "./exp-node-huh.scm"
%use (keyword-let) "./keyword-let.scm"
%use (make-node-displayer) "./make-node-displayer.scm"
%use (node-display node-label set-node-display!) "./node.scm"
%use (rtree-references) "./rtree-references.scm"
%use (rtree-substitute-labels) "./rtree-substitute-labels.scm"

(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define (get-label node)
    (or (node-display node)
        (node-label node)))
  (define (subs T)
    (rtree-substitute-labels T))

  (define (tuple->binding ref)
    (define key (car ref))
    (define referenced? (cadr ref))
    (define value (cddr ref))
    (list (get-label key) (map subs value)))

  (define potential-refs
    (filter (fp (ref referenced? . children)
                (or referenced?
                    (not (exp-node? ref))))
            all-references))

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            potential-refs))

  (define get-display
    (make-node-displayer))

  (define _0
    (for-each
     (lambda (p)
       (define node (car p))
       (define referenced? (cadr p))
       (set-node-display! node (get-display node)))
     potential-refs))

  (define body
    (subs tree))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple->binding useful-refs) (list body)))))
