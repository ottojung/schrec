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
  (define-module (extensions eval-single-form-huh)
    :export (eval-single-form?)
    :use-module ((euphrates list-length-eq) :select (list-length=))
    :use-module ((schrec check-environment) :select (check-environment))
    :use-module ((schrec get-eval-env) :select (get-eval-env))
    :use-module ((schrec node) :select (node-children))
    )))



(define (eval-single-form? self node)
  (define children (node-children node))
  (and (list-length= 3 children)
       (check-environment (get-eval-env node))))
