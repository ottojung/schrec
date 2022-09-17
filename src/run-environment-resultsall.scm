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

%var run-environment-resultsall

%use (stack->list stack-make) "./euphrates/stack.scm"
%use (block-fn) "./block-fn.scm"
%use (eval-hook) "./eval-hook.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (match-blocks/nondet) "./match-blocks-nondet.scm"
%use (match-thread-relative) "./match-thread-relative.scm"
%use (node-children) "./node.scm"
%use (rewrite-rewrite-block/nondet) "./rewrite-rewrite-block-nondet.scm"
%use (soft-uninitialize-variable!) "./soft-uninitialize-variable-bang.scm"
%use (thread-fork) "./thread-fork.scm"
%use (thread-relative) "./thread-relative.scm"

(define (run-environment-resultsall main-input env body pointer-node)
  (define free-stack (stack-make))
  (define blocks (node-children env))

  ;; FIXME: copy the replace pattern first.
  (define result
    (let ((re-match-threads
           (match-blocks/nondet free-stack main-input pointer-node blocks)))
      (define re-threads
        (map
         (match-thread-relative
          (thread-fork
           (for-each (block-fn rewrite-rewrite-block/nondet free-stack) blocks)
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
