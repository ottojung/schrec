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

%var run-environment-resultsfirst-with-or/det

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack-make) "./euphrates/stack.scm"
%use (or-expression?) "./or-expression-huh.scm"
%use (and-expression?) "./and-expression-huh.scm"
%use (check-or-expression-syntax) "./check-or-expression-syntax.scm"
%use (check-and-expression-syntax) "./check-and-expression-syntax.scm"
%use (node-children) "./node.scm"
%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block/det) "./match-rewrite-block-det.scm"
%use (rewrite-rewrite-block/det) "./rewrite-rewrite-block-det.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"

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
