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

%var rtree-dereference

%use (raisu) "./euphrates/raisu.scm"
%use (rtree-children rtree-ref rtree-value rtree?) "./euphrates/rtree.scm"
%use (branch-node-label) "./branch-node-label.scm"
%use (node-label) "./node.scm"

(define (rtree-dereference T)
  (let loop ((T T))
    (cond
     ((vector? T)
      (rtree-value (vector-ref T 0)))
     ((rtree? T)
      (if (or (rtree-ref T)
              (and (null? (rtree-children T))
                   (not (equal? branch-node-label (node-label (rtree-value T))))))
          (rtree-value T)
          (map loop (rtree-children T))))
     (else (raisu 'Unknown-type-in-dereference T)))))
