;;;; Copyright (C) 2023 Otto Jung
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
  (define-module (schrec make-let-form)
    :export (make-let-form)
    :use-module ((schrec flattenme) :select (make-flattenme))
    :use-module ((schrec keyword-let) :select (keyword-let))
    )))


(define (make-let-form bindings single? body)
  (if (null? bindings)
      (if single?
          (car body)
          (make-flattenme body))
      (cons
       keyword-let
       (cons
        bindings
        (if single?
            body
            (list body))))))
