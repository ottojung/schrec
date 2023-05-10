;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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
  (define-module (schrec check-environment)
    :export (check-environment)
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((euphrates list-length-eq) :select (list-length=))
    :use-module ((check-rewrite-block) :select (check-rewrite-block))
    :use-module ((get-environment-blocks) :select (get-environment-blocks))
    :use-module ((node) :select (node-children))
    )))



;; returns #t or success
(define (check-environment env)
  (define children (node-children env))
  (and (list-length= 3 children)
       (let ((blocks (get-environment-blocks env)))
         (list-and-map check-rewrite-block blocks))))


