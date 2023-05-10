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

%var reduce/resultsrandom

%use (list-find-first) "./euphrates/list-find-first.scm"
%use (list-random-shuffle) "./euphrates/list-random-shuffle.scm"
%use (eval/resultsrandom/node) "./eval-resultsrandom-node.scm"
%use (find-partially-sorted-evals) "./find-partially-sorted-evals.scm"
%use (get-current-thread) "./get-current-thread.scm"

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
