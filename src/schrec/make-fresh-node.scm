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
  (define-module (schrec make-fresh-node)
    :export (make-fresh-node)
    :use-module ((schrec node) :select (make-node make-special-node))
    )))



(define make-fresh-node
  (let ((counter 0))
    (case-lambda
     ((label namespace children)
       (set! counter (+ 1 counter))
       (make-node counter children label namespace))
     ((label namespace children specialty)
       (set! counter (+ 1 counter))
       (make-special-node counter namespace specialty)))))
