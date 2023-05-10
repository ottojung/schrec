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

%var run-environment-resultsfirst/multi

%use (comp) "./euphrates/comp.scm"
%use (stack->list stack-make) "./euphrates/stack.scm"
%use (eval-hook) "./eval-hook.scm"
%use (get-environment-blocks) "./get-environment-blocks.scm"
%use (get-environment-constants) "./get-environment-constants.scm"
%use (get-environment-input) "./get-environment-input.scm"
%use (match-blocks/nondet) "./match-blocks-nondet.scm"
%use (rewrite-rewrite-block/nondet) "./rewrite-rewrite-block-nondet.scm"
%use (soft-uninitialize-variable!) "./soft-uninitialize-variable-bang.scm"
%use (with-current-match-thread) "./with-current-match-thread.scm"

(define (run-environment-resultsfirst/multi env body pointer-node)
  (define blocks (get-environment-blocks env))
  (define constants (get-environment-constants env))
  (define main-input (get-environment-input env))
  (define free-stack (stack-make))

  ;; FIXME: copy the replace pattern first.
  (define result
    (let ((re-match-threads
           (match-blocks/nondet free-stack constants main-input pointer-node blocks)))
      (if (null? re-match-threads) #f
          (let ((chosen-thread (car re-match-threads))) ;; NOTE: choosing the greediest match
            (with-current-match-thread
             chosen-thread
             (for-each (comp (rewrite-rewrite-block/nondet free-stack)) blocks))
            #t))))

  (for-each soft-uninitialize-variable!
            (stack->list free-stack))

  (and result
       (let ((hook (eval-hook)))
         (when hook (hook env body pointer-node))
         #t)))
