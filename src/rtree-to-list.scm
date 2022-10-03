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
%use (graph->list/with-substitutes) "./graph-to-list-with-substitutes.scm"
%use (keyword-let) "./keyword-let.scm"
%use (leaf-node?) "./leaf-node-huh.scm"
%use (make-node-displayer) "./make-node-displayer.scm"
%use (named-node?) "./named-node-huh.scm"
%use (node-children node-display node-id set-node-display!) "./node.scm"
%use (root-namespace-node?) "./root-namespace-node-huh.scm"
%use (rtree-references) "./rtree-references.scm"

(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define potential-ref?
    (fp (node shared?)
        (or shared?
            (named-node? node))))

  (define (constant? node)
    (and (leaf-node? node) (named-node? node)))
  (define useful-ref?
    (fp (node shared?)
        (or (and shared? (not (constant? node)))
            (not (root-namespace-node? node)))))

  (define substitute-ref?
    (fp (node shared?)
        (or shared?
            (leaf-node? node)
            (not (root-namespace-node? node)))))

  (define get-display
    (make-node-displayer))

  (define potential-refs
    (filter potential-ref? all-references))
  (define _0
    (for-each
     (fp (node shared?)
         (set-node-display! node (get-display node)))
     potential-refs))

  (define to-substitute
    (list->hashset
     (map (compose node-id car)
          (filter substitute-ref? potential-refs))))
  (define (subs node)
    (graph->list/with-substitutes to-substitute node))
  (define body
    (subs (rtree-value tree)))

  (define tuple->binding
    (fp (node shared?)
        (list (node-display node) (map subs (node-children node)))))

  (define useful-refs
    (filter useful-ref? potential-refs))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple->binding useful-refs) (list body)))))
