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

%var graph->rtree

%use (node-children node-id set-node-children! node-label) "./node.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (rtree rtree-ref set-rtree-ref! rtree-value rtree-children set-rtree-children!) "./euphrates/rtree.scm"

(define (graph->rtree g)
  (define H (make-hashmap))
  (define counter 0)
  (let loop ((g g))
    (let ((get (hashmap-ref H (node-id g) #f)))
      (if get
          (begin
            (unless (rtree-ref get)
              (set! counter (+ 1 counter))
              (set-rtree-ref! get counter))
            (vector get))
          (let* ((B (rtree #f g #f)))
            (hashmap-set! H (node-id g) B)
            (set-rtree-children! B (map loop (node-children g)))
            B)))))
