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

%var rtree->list/vectored

%use (rtree rtree-ref set-rtree-ref! rtree-leaf? rtree-value) "./euphrates/rtree.scm"
%use (node-label) "./node.scm"

(define (rtree->list/vectored tree)
  (let loop ((tree tree))
    (if (vector? tree)
        (vector (rtree-ref (vector-ref tree 0)))
        (let ((recur (map loop (rtree-children tree))))
          (if (rtree-ref tree)
              (vector (rtree-ref tree) recur)
              (if (null? recur)
                  (node-label (rtree-value tree))
                  recur))))))
