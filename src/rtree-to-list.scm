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
%use (node-children node-display node-label set-node-display!) "./node.scm"
%use (rtree-references) "./rtree-references.scm"
%use (rtree-substitute-labels) "./rtree-substitute-labels.scm"

(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define potential-refs
    (filter (fp (node referenced? . children)
                (or referenced?
                    (not (exp-node? node))))
            all-references))

  (define useful-refs
    (filter (fp (node referenced? . children)
                (and referenced?
                     (not (null? (node-children node)))))
            potential-refs))

  (define get-display
    (make-node-displayer))

  (define _0
    (for-each
     (fp (node referenced? . children)
         (set-node-display! node (get-display node)))
     potential-refs))

  (define (get-label node)
    (or (node-display node)
        (node-label node)))
  (define body
    (rtree-substitute-labels tree))

  (define tuple->binding
    (fp (node referenced? . children)
        (list (get-label node) (map rtree-substitute-labels children))))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple->binding useful-refs) (list body)))))
