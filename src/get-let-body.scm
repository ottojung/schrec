;;;; Copyright (C) 2021, 2022  Otto Jung
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

%var get-let-body

%use (raisu) "./euphrates/raisu.scm"

(define (get-let-body let-list)
  (if (null? let-list)
      (raisu 'not-a-let-list let-list)
      (if (null? (cdr let-list))
          (raisu 'let-does-not-have-bindings let-list)
          (if (null? (cddr let-list))
              (raisu 'let-does-not-have-a-body let-list)
              (if (null? (cdddr let-list))
                  (caddr let-list)
                  (cddr let-list))))))
