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

(cond-expand
 (guile
  (define-module (rtree-to-list-vectored)
    :export (rtree->list/vectored)
    :use-module ((euphrates rtree) :select (rtree-children rtree-ref rtree-value))
    :use-module ((node) :select (node-label node-namespace))
    )))



(define (rtree->list/vectored tree)
  (let loop ((tree tree))
    (if (vector? tree)
        (vector (rtree-ref (vector-ref tree 0)))
        (let ((recur (map loop (rtree-children tree))))
          (if (rtree-ref tree)
              (vector (rtree-ref tree) recur)
              (if (null? recur)
                  (cons (node-label (rtree-value tree))
                        (node-namespace (rtree-value tree)))
                  recur))))))
