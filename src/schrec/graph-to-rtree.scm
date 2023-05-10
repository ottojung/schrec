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
  (define-module (schrec graph-to-rtree)
    :export (graph->rtree)
    :use-module ((euphrates hashmap) :select (hashmap-ref hashmap-set! make-hashmap))
    :use-module ((euphrates rtree) :select (rtree rtree-ref set-rtree-children! set-rtree-ref!))
    :use-module ((schrec node) :select (node-children node-id))
    )))



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
