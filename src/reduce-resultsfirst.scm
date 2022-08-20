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

%run guile

%var reduce/resultsfirst

%use (list-find-first) "./euphrates/list-find-first.scm"

%use (eval/resultsfirst/node) "./eval-resultsfirst-node.scm"
%use (find-sorted-evals) "./find-sorted-evals.scm"
%use (get-current-thread) "./get-current-thread.scm"

(define (reduce/resultsfirst g)
  (lambda _
    (let oloop ((reduced-once? #f))
      (define evals (find-sorted-evals g))
      (if (list-find-first eval/resultsfirst/node #f evals)
          (oloop #t)
          (and reduced-once?
               (get-current-thread))))))
