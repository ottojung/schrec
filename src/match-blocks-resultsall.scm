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

%var match-blocks/resultsall

%use (list-map/flatten) "./euphrates/list-map-flatten.scm"

%use (match-rewrite-block/resultsall) "./match-rewrite-block-resultsall.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (match-thread-relative) "./match-thread-relative.scm"
%use (block-fn) "./block-fn.scm"
%use (associate-variable!/det/nondet) "./associate-variable-bang-nondet.scm"

;; returns a list of `match-thread's
(define (match-blocks/resultsall free-stack main-input pointer-node blocks)
  (associate-variable!/det/nondet free-stack main-input (list pointer-node))
  (let loop ((match-threads (list (get-current-match-thread)))
             (blocks blocks))
    (if (null? blocks) match-threads
        (let ((cur (car blocks)))
          (define new-match-threads
            (list-map/flatten
             (match-thread-relative
              ((block-fn match-rewrite-block/resultsall free-stack) cur))
             match-threads))
          (loop new-match-threads (cdr blocks))))))
