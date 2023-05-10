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

(cond-expand
 (guile
  (define-module (list-to-graph)
    :export (list->graph)
    :use-module ((euphrates lexical-scope) :select (lexical-scope-make lexical-scope-ref lexical-scope-set!))
    :use-module ((check-let-syntax) :select (check-let-syntax))
    :use-module ((let-expression-huh) :select (let-expression?))
    :use-module ((make-fresh-atom-node) :select (make-fresh-atom-node))
    :use-module ((make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((parse-let-expression) :select (parse-let-expression))
    :use-module ((root-namespace) :select (root-namespace))
    )))



(define (list->graph lst)
  (define scope (lexical-scope-make root-namespace))
  (let loop ((lst lst))
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (parse-let-expression scope loop lst))
            (make-fresh-branch-node (map loop lst)))
        (let ((existing (lexical-scope-ref scope lst #f)))
          (or existing
              (let ((new (make-fresh-atom-node lst root-namespace)))
                (lexical-scope-set! scope root-namespace lst new)
                new))))))
