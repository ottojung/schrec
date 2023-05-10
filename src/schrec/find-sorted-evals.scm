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
  (define-module (schrec find-sorted-evals)
    :export (find-sorted-evals)
    :use-module ((schrec find-sorted-eval-likes) :select (find-sorted-eval-likes))
    :use-module ((schrec keyword-eval-multi) :select (keyword-eval-multi))
    :use-module ((schrec keyword-eval-single) :select (keyword-eval-single))
    )))



;; returns all eval nodes in a bottommost-to-topmost order
(define (find-sorted-evals graph)
  (find-sorted-eval-likes
   (list keyword-eval-single
         keyword-eval-multi)
   graph))
