;;;; Copyright (C) 2022  Otto Jung
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

%var run-environment/nondet

%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack-make stack->list) "./euphrates/stack.scm"

%use (node-children) "./node.scm"
%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block) "./match-rewrite-block.scm"
%use (rewrite-rewrite-block) "./rewrite-rewrite-block.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"
%use (uninitialize-variable!) "./uninitialize-variable-bang.scm"
%use (check-rewrite-block) "./check-rewrite-block.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (eval-hook) "./eval-hook.scm"

(define (run-environment/nondet env main-input body)
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
     (list-and-map check-rewrite-block blocks)
     (list-and-map (with-initialization match-rewrite-block) blocks)
     (for-each (with-initialization rewrite-rewrite-block) blocks)))

  (for-each uninitialize-variable!
            (stack->list free-stack))

  (if result
      (let ((hook (eval-hook)))
        (when hook (hook body))
        (list (get-current-thread)))
      '()))
