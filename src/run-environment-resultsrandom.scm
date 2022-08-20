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

%var run-environment-resultsrandom

%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack-make stack->list) "./euphrates/stack.scm"
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"
%use (list-random-element) "./euphrates/list-random-element.scm"

%use (node-children) "./node.scm"
%use (rewrite-rewrite-block/nondet) "./rewrite-rewrite-block-nondet.scm"
%use (soft-uninitialize-variable!) "./soft-uninitialize-variable-bang.scm"
%use (eval-hook) "./eval-hook.scm"
%use (with-current-match-thread) "./with-current-match-thread.scm"
%use (thread-fork) "./thread-fork.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (block-fn) "./block-fn.scm"
%use (match-blocks/nondet) "./match-blocks-nondet.scm"

(define (run-environment-resultsrandom main-input env body pointer-node)
  (define free-stack (stack-make))
  (define blocks (node-children env))

  (define result
    (let ((re-match-threads
           (match-blocks/nondet free-stack main-input pointer-node blocks)))
      (if (null? re-match-threads) #f
          (let ((chosen-thread (list-random-element re-match-threads)))
            (with-current-match-thread
             chosen-thread
             (for-each (block-fn rewrite-rewrite-block/nondet free-stack) blocks))
            #t))))

  (for-each soft-uninitialize-variable!
            (stack->list free-stack))

  (and result
       (let ((hook (eval-hook)))
         (when hook (hook body))
         #t)))
