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
  (define-module (schrec match-thread-relative)
    :export (match-thread-relative)
    :use-module ((schrec with-current-match-thread) :select (with-current-match-thread))
    )))



(define-syntax match-thread-relative
  (syntax-rules ()
    ((_ . bodies)
     (lambda (match-thread)
       (with-current-match-thread match-thread . bodies)))))
