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
  (define-module (schrec run-environment-resultsall)
    :export (run-environment-resultsall)
    :use-module ((euphrates comp) :select (comp))
    :use-module ((euphrates stack) :select (stack->list stack-make))
    :use-module ((schrec eval-hook) :select (eval-hook))
    :use-module ((schrec get-current-thread) :select (get-current-thread))
    :use-module ((schrec get-environment-blocks) :select (get-environment-blocks))
    :use-module ((schrec get-environment-constants) :select (get-environment-constants))
    :use-module ((schrec get-environment-input) :select (get-environment-input))
    :use-module ((schrec match-blocks-nondet) :select (match-blocks/nondet))
    :use-module ((schrec match-thread-relative) :select (match-thread-relative))
    :use-module ((schrec rewrite-rewrite-block-nondet) :select (rewrite-rewrite-block/nondet))
    :use-module ((schrec soft-uninitialize-variable-bang) :select (soft-uninitialize-variable!))
    :use-module ((schrec thread-fork) :select (thread-fork))
    :use-module ((schrec thread-relative) :select (thread-relative))
    )))



(define (run-environment-resultsall env body pointer-node)
  (define blocks (get-environment-blocks env))
  (define constants (get-environment-constants env))
  (define main-input (get-environment-input env))
  (define free-stack (stack-make))

  ;; FIXME: copy the replace pattern first.
  (define result
    (let ((re-match-threads
           (match-blocks/nondet free-stack constants main-input pointer-node blocks)))
      (define re-threads
        (map
         (match-thread-relative
          (thread-fork
           (for-each (comp (rewrite-rewrite-block/nondet free-stack)) blocks)
           (get-current-thread)))
         re-match-threads))

      re-threads))

  (for-each soft-uninitialize-variable!
            (stack->list free-stack))

  (if (null? result) '()
      (let ((hook (eval-hook)))
        (when hook
          (for-each (thread-relative (hook env body pointer-node)) result))
        result)))
