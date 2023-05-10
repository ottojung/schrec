;;;; Copyright (C) 2022, 2023 Otto Jung
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
  (define-module (schrec run-environment-resultsfirst-multi)
    :export (run-environment-resultsfirst/multi)
    :use-module ((euphrates comp) :select (comp))
    :use-module ((euphrates stack) :select (stack->list stack-make))
    :use-module ((eval-hook) :select (eval-hook))
    :use-module ((get-environment-blocks) :select (get-environment-blocks))
    :use-module ((get-environment-constants) :select (get-environment-constants))
    :use-module ((get-environment-input) :select (get-environment-input))
    :use-module ((match-blocks-nondet) :select (match-blocks/nondet))
    :use-module ((rewrite-rewrite-block-nondet) :select (rewrite-rewrite-block/nondet))
    :use-module ((soft-uninitialize-variable-bang) :select (soft-uninitialize-variable!))
    :use-module ((with-current-match-thread) :select (with-current-match-thread))
    )))



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
