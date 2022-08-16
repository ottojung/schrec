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

%var run-environment

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack-make stack->list) "./euphrates/stack.scm"

%use (or-expression?) "./or-expression-huh.scm"
%use (and-expression?) "./and-expression-huh.scm"
%use (node-children) "./node.scm"
%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block) "./match-rewrite-block.scm"
%use (rewrite-rewrite-block) "./rewrite-rewrite-block.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"
%use (uninitialize-variable!) "./uninitialize-variable-bang.scm"
%use (eval-hook) "./eval-hook.scm"

(define (run-environment env main-input body)
  (define free-stack (stack-make))
  (define blocks (node-children env))

  (define (with-initialization fn)
    (lambda (block)
      (and
       (initialize-rewrite-block free-stack block main-input)
       (let ((ret (fn free-stack block main-input)))
         (uninitialize-rewrite-block free-stack block main-input)
         ret))))

  (define result
    (and
     (list-and-map (with-initialization match-rewrite-block) blocks)
     (for-each (with-initialization rewrite-rewrite-block) blocks)))

  (for-each uninitialize-variable!
            (stack->list free-stack))

  (when result
    (let ((hook (eval-hook)))
      (when hook (hook body))))

  result)
