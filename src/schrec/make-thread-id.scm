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
  (define-module (schrec make-thread-id)
    :export (make-thread-id)
    :use-module ((get-current-thread) :select (get-current-thread))
    :use-module ((thread-obj) :select (thread-obj-ctr thread-obj-lst))
    )))



(define make-thread-id
  (let ((counter 0))
    (lambda ()
      (set! counter (+ 1 counter))
      (let* ((current (get-current-thread))
             (lst (thread-obj-lst current)))
        (thread-obj-ctr
         (append lst (list counter)))))))
