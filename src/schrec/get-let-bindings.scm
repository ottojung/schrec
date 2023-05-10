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
  (define-module (schrec get-let-bindings)
    :export (get-let-bindings)
    :use-module ((euphrates raisu) :select (raisu))
    )))



(define (get-let-bindings let-list)
  (if (null? let-list)
      (raisu 'not-a-let-list let-list)
      (if (null? (cdr let-list))
          (raisu 'let-does-not-have-bindings let-list)
          (cadr let-list))))
