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
  (define-module (schrec run-environment-resultsfirst-with-or-det)
    :export (run-environment-resultsfirst-with-or/det)
    :use-module ((euphrates fn) :select (fn))
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((euphrates list-or-map) :select (list-or-map))
    :use-module ((euphrates stack) :select (stack-make))
    :use-module ((schrec and-expression-huh) :select (and-expression?))
    :use-module ((schrec check-and-expression-syntax) :select (check-and-expression-syntax))
    :use-module ((schrec check-or-expression-syntax) :select (check-or-expression-syntax))
    :use-module ((schrec initialize-rewrite-block) :select (initialize-rewrite-block))
    :use-module ((schrec match-rewrite-block-det) :select (match-rewrite-block/det))
    :use-module ((schrec node) :select (node-children))
    :use-module ((schrec or-expression-huh) :select (or-expression?))
    :use-module ((schrec rewrite-rewrite-block-det) :select (rewrite-rewrite-block/det))
    :use-module ((schrec uninitialize-rewrite-block) :select (uninitialize-rewrite-block))
    )))



(define (run-environment-resultsfirst-with-or/det env main-input)
  (define free-stack (stack-make))

  (define (expr-map fn)
    (let loop ((env env))
      (cond
       ((or-expression? env)
        (check-or-expression-syntax env)
        (list-or-map loop (cdr (node-children env))))
       ((and-expression? env)
        (check-and-expression-syntax env)
        (list-and-map loop (cdr (node-children env))))
       (else
        (fn free-stack env main-input)))))

  (define (expr-for-each fn)
    (let loop ((env env))
      (cond
       ((or-expression? env)
        (check-or-expression-syntax env)
        (for-each loop (cdr (node-children env))))
       ((and-expression? env)
        (check-and-expression-syntax env)
        (for-each loop (cdr (node-children env))))
       (else
        (fn free-stack env main-input)))))

  (define run-result
    (and (expr-for-each initialize-rewrite-block)
         (expr-map match-rewrite-block/det)
         (expr-for-each rewrite-rewrite-block/det)))

  (and (expr-for-each uninitialize-rewrite-block)
       run-result))
