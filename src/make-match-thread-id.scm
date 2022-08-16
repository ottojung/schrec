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

%var make-match-thread-id

%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (thread-obj-ctr thread-obj-lst) "./thread-obj.scm"

(define make-match-thread-id
  (let ((counter 0))
    (lambda ()
      (set! counter (+ 1 counter))
      (let* ((current (get-current-match-thread))
             (lst (thread-obj-lst current)))
        (thread-obj-ctr
         (append lst (list counter)))))))
