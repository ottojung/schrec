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

%var debug-log-bind

%use (dprintln) "./euphrates/dprintln.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (get-head) "./get-head.scm"
%use (variable-get-association-or-nondet) "./variable-get-association-or-nondet.scm"

(define (debug-log-bind current taken result)
  (let* ((cur1 (get-head 4 current))
         ;; (taken1 (list->vector (map (lambda (x) (get-head 4 x)) taken)))
         (taken1
          (let ((ass (variable-get-association-or-nondet current #f)))
            (list->vector (map (lambda (n) (get-head 4 n)) ass)))))
    (dprintln "Bind ~s to ~s -> ~s    [~s]" cur1 taken1 result (get-current-match-thread))))
