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
  (define-module (schrec check-let-syntax)
    :export (check-let-syntax)
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec get-let-bindings) :select (get-let-bindings))
    :use-module ((schrec get-let-body) :select (get-let-body))
    )))



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
    (unless (list? bindings)
      (raisu 'let-bindings-must-be-a-list bindings lst))

    (for-each
     (lambda (binding)
       (unless (list? binding)
         (raisu 'let-binding-must-be-a-list binding lst))

       (unless (= 2 (length binding))
         (raisu 'let-binding-must-be-of-length-2 binding lst))

       (unless (or (symbol? (car binding))
                   (number? (car binding)))
         (raisu 'let-binding-name-must-be-a-symbol-or-a-number binding lst))

       (unless (or (symbol? (cadr binding))
                   (list? (cadr binding))
                   (number? (cadr binding)))
         (raisu 'let-binding-value-must-be-of-simple-type
                binding lst)))
     bindings))

  (let ((body (get-let-body lst)))
    (unless (or (list? body) (symbol? body) (number? body))
      (raisu 'let-body-is-of-wierd-type body))))
