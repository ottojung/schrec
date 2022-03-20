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

%var run-topdown-correct

%use (list-find-first) "./euphrates/list-find-first.scm"
%use (find-sorted-evals) "./find-sorted-evals.scm"
%use (reduce-node-topdown) "./reduce-node-topdown.scm"

(define (run-topdown-correct graph)
  (let oloop ()
    (define evals (find-sorted-evals graph))
    (when (list-find-first reduce-node-topdown #f evals)
      (oloop))))
