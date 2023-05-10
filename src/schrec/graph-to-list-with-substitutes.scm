;;;; Copyright (C) 2022, 2023 Otto Jung
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
  (define-module (schrec graph-to-list-with-substitutes)
    :export (graph->list/with-substitutes)
    :use-module ((euphrates hashset) :select (hashset-add! hashset-delete! hashset-has? make-hashset))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec get-head) :select (get-head))
    :use-module ((schrec node) :select (node-children node-display node-id node-label))
    )))



(define (graph->list/with-substitutes to-substitute g)
  (define (get-label node)
    (or (node-display node)
        (node-label node)))

  (define S (make-hashset))
  (let loop ((node g))
    (if (hashset-has? to-substitute (node-id node))
        (get-label node)
        (begin
          (when (hashset-has? S (node-id node))
            (raisu 'graph-substitution-failed:loop (get-head 5 node)))
          (hashset-add! S (node-id node))
          (let ((result (map loop (node-children node))))
            (hashset-delete! S (node-id node))
            result)))))
