;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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

(cond-expand
 (guile
  (define-module (schrec rtree-to-list)
    :export (rtree->list)
    :use-module ((euphrates fp) :select (fp))
    :use-module ((euphrates ihashset) :select (list->hashset))
    :use-module ((euphrates list-singleton-q) :select (list-singleton?))
    :use-module ((euphrates rtree) :select (rtree-value))
    :use-module ((constant-node-huh) :select (constant-node?))
    :use-module ((graph-to-list-with-substitutes) :select (graph->list/with-substitutes))
    :use-module ((keyword-let) :select (keyword-let))
    :use-module ((make-node-displayer) :select (make-node-displayer))
    :use-module ((named-node-huh) :select (named-node?))
    :use-module ((node) :select (node-children node-display node-id set-node-display!))
    :use-module ((root-namespace-node-huh) :select (root-namespace-node?))
    :use-module ((rtree-references) :select (rtree-references))
    )))



(define (rtree->list tree)
  (define all-references
    (rtree-references tree))

  (define potential-ref?
    (fp (node shared?)
        (or shared?
            (named-node? node))))

  (define useful-ref?
    (fp (node shared?)
        (or (and shared? (not (constant-node? node)))
            (not (root-namespace-node? node)))))

  (define substitute-ref?
    (fp (node shared?)
        (or shared?
            (named-node? node))))

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
    (let ((all (subs (rtree-value tree))))
      (if (and (pair? all) (list-singleton? all))
          (car all)
          all)))

  (define tuple->binding
    (fp (node shared?)
        (list (node-display node) (map subs (node-children node)))))

  (define useful-refs
    (filter useful-ref? potential-refs))

  (if (null? useful-refs) body
      (cons keyword-let (cons (map tuple->binding useful-refs) (list body)))))
