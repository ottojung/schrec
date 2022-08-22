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

%var check-let-syntax

%use (raisu) "./euphrates/raisu.scm"

%use (get-let-bindings) "./get-let-bindings.scm"
%use (get-let-body) "./get-let-body.scm"

(define (check-let-syntax lst)
  (unless (list? lst)
    (raisu 'let-must-be-a-list lst))

  (unless (< 0 (length lst))
    (raisu 'let-should-not-be-empty lst))

  (unless (< 1 (length lst))
    (raisu 'let-does-not-even-have-bindings lst))

  (unless (< 2 (length lst))
    (raisu 'let-is-missing-a-body lst))

  (let ((bindings (get-let-bindings lst)))
    (for-each
     (lambda (binding)
       (unless (list? binding)
         (raisu 'let-binding-must-be-a-list binding lst))

       (unless (= 2 (length binding))
         (raisu 'let-binding-must-be-of-length-2 binding lst))

       (unless (symbol? (car binding))
         (raisu 'let-binding-name-must-be-a-symbol binding lst))

       (unless (or (symbol? (cadr binding))
                   (list? (cadr binding))
                   (number? (cadr binding)))
         (raisu 'let-binding-value-must-be-of-simple-type
                binding lst)))
     bindings))

  (let ((body (get-let-body lst)))
    (unless (list? body)
      (raisu 'let-body-must-be-a-list body))))
