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

(cond-expand
 (guile
  (define-module (thread-fork)
    :export (thread-fork)
    :use-module ((current-thread-p) :select (current-thread/p))
    :use-module ((make-thread-id) :select (make-thread-id))
    )))



(define-syntax thread-fork
  (syntax-rules ()
    ((_ . args)
     (parameterize ((current-thread/p (make-thread-id))) . args))))
