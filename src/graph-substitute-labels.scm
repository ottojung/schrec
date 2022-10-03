;;;; Copyright (C) 2022  Otto Jung
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

%var graph-substitute-labels

%use (hashset-add! hashset-delete! hashset-ref make-hashset) "./euphrates/ihashset.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (get-head) "./get-head.scm"
%use (node-children node-display node-id node-label) "./node.scm"

(define (graph-substitute-labels to-substitute g)
  (define (get-label node)
    (or (node-display node)
        (node-label node)))

  (define S (make-hashset))
  (let loop ((node g))
    (if (hashset-ref to-substitute (node-id node))
        (get-label node)
        (begin
          (when (hashset-ref S (node-id node))
            (raisu 'graph-substitution-failed:loop (get-head 5 node)))
          (hashset-add! S (node-id node))
          (let ((result (map loop (node-children node))))
            (hashset-delete! S (node-id node))
            result)))))
