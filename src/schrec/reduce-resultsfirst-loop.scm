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
  (define-module (schrec reduce-resultsfirst-loop)
    :export (reduce/resultsfirst/loop)
    :use-module ((euphrates list-find-first) :select (list-find-first))
    :use-module ((eval-resultsfirst-node-loop) :select (eval/resultsfirst/node/loop))
    :use-module ((find-sorted-evals) :select (find-sorted-evals))
    )))



;; NOTE: not semantically correct either
(define (reduce/resultsfirst/loop graph)
  (let oloop ()
    (define evals (find-sorted-evals graph))
    (when (list-find-first eval/resultsfirst/node/loop #f evals)
      (oloop))))
