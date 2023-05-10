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
  (define-module (schrec reduce-resultsfirst)
    :export (reduce/resultsfirst)
    :use-module ((euphrates list-find-first) :select (list-find-first))
    :use-module ((eval-resultsfirst-node) :select (eval/resultsfirst/node))
    :use-module ((find-sorted-evals) :select (find-sorted-evals))
    :use-module ((get-current-thread) :select (get-current-thread))
    )))



(define (reduce/resultsfirst g)
  (lambda _
    (let oloop ((reduced-once? #f))
      (define evals (find-sorted-evals g))
      (if (list-find-first eval/resultsfirst/node #f evals)
          (oloop #t)
          (and reduced-once?
               (get-current-thread))))))
