;;;; Copyright (C) 2022, 2023 Otto Jung
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
  (define-module (schrec reduce-resultsrandom)
    :export (reduce/resultsrandom)
    :use-module ((euphrates list-find-first) :select (list-find-first))
    :use-module ((euphrates list-random-shuffle) :select (list-random-shuffle))
    :use-module ((schrec eval-resultsrandom-node) :select (eval/resultsrandom/node))
    :use-module ((schrec find-partially-sorted-evals) :select (find-partially-sorted-evals))
    :use-module ((schrec get-current-thread) :select (get-current-thread))
    )))



(define (reduce/resultsrandom graph)
  (define (eval-fun)
    ;; These `evals' are grouped such that
    ;;   in each group every element can be run first
    (define evals (find-partially-sorted-evals graph))

    (let loop ((evals evals))
      (if (null? evals) #f
          (let* ((group-orig (car evals))
                 (group (list-random-shuffle group-orig))
                 (successful?
                  (list-find-first eval/resultsrandom/node #f group)))
            (or successful?
                (loop (cdr evals)))))))

  (lambda _
    (let oloop ((reduced-once? #f))
      (if (eval-fun)
          (oloop #t)
          (and reduced-once?
               (get-current-thread))))))
