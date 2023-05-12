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
  (define-module (schrec alpharename-list)
    :export (alpharename-list)
    :use-module ((euphrates lexical-scope) :select (lexical-scope-make lexical-scope-ref lexical-scope-set!))
    :use-module ((euphrates list-singleton-q) :select (list-singleton?))
    :use-module ((schrec alpharename-let-expression) :select (alpharename-let-expression))
    :use-module ((schrec check-let-syntax) :select (check-let-syntax))
    :use-module ((schrec flattenme) :select (flattenme-lst flattenme?))
    :use-module ((schrec let-expression-huh) :select (let-expression?))
    :use-module ((schrec make-let-form) :select (make-let-form))
    :use-module ((schrec make-unique-id) :select (make-unique-id))
    :use-module ((schrec root-namespace) :select (root-namespace))
    )))


(define (alpharename-list lst)
  (define scope (lexical-scope-make root-namespace))
  (define result
    (let loop ((lst lst))
      (if (pair? lst)
          (if (let-expression? lst)
              (begin
                (check-let-syntax lst)
                (alpharename-let-expression scope loop lst))
              (apply
               append
               (map
                (lambda (x)
                  (if (flattenme? x)
                      (flattenme-lst x)
                      (list x)))
                (map loop lst))))

          (let ((existing (lexical-scope-ref scope lst #f)))
            (or existing
                (let ((new (make-unique-id lst root-namespace)))
                  (lexical-scope-set! scope root-namespace lst new)
                  new))))))

  (define single?
    (and (pair? result) (list-singleton? result)))
  (define ret
    (make-let-form '() single? result))

  (if (flattenme? ret)
      (flattenme-lst ret)
      ret))