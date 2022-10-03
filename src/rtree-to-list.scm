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
%use (list->hashset) "./euphrates/ihashset.scm"
%use (rtree-value) "./euphrates/rtree.scm"
%use (exp-node?) "./exp-node-huh.scm"
%use (graph-substitute-labels) "./graph-substitute-labels.scm"
%use (keyword-let) "./keyword-let.scm"
%use (make-node-displayer) "./make-node-displayer.scm"
%use (node-children node-display node-id set-node-display!) "./node.scm"
%use (rtree-references) "./rtree-references.scm"

(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define potential-refs
    (filter (fp (node referenced?)
                (or referenced?
                    (not (exp-node? node))))
            all-references))

  (define useful-refs
    (filter (fp (node referenced?)
                (and referenced?
                     (not (null? (node-children node)))))
            potential-refs))

  (define substitute-refs
    (filter (fp (node referenced?)
                (or referenced?
                    (null? (node-children node))))
            potential-refs))
  (define to-substitute
    (list->hashset
     (map (compose node-id car) substitute-refs)))

  (define get-display
    (make-node-displayer))

  (define _0
    (for-each
     (fp (node referenced?)
         (set-node-display! node (get-display node)))
     potential-refs))

  (define (subs node)
    (graph-substitute-labels to-substitute node))
  (define body
    (subs (rtree-value tree)))

  (define tuple->binding
    (fp (node referenced?)
        (list (node-display node) (map subs (node-children node)))))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple->binding useful-refs) (list body)))))
