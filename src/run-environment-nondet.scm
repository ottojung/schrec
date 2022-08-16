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
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"

%use (node-children) "./node.scm"
%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block/nondet) "./match-rewrite-block-nondet.scm"
%use (rewrite-rewrite-block/nondet) "./rewrite-rewrite-block-nondet.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"
%use (soft-uninitialize-variable!) "./soft-uninitialize-variable-bang.scm"
%use (check-rewrite-block) "./check-rewrite-block.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (eval-hook) "./eval-hook.scm"
%use (match-thread-relative) "./match-thread-relative.scm"
%use (thread-fork) "./thread-fork.scm"
%use (get-current-thread) "./get-current-thread.scm"

%use (debugv) "./euphrates/debugv.scm"
%use (debug) "./euphrates/debug.scm"
%use (debug-show-variable-bindings) "./debug-show-variable-bindings.scm"
%use (get-head) "./get-head.scm"

(define (run-environment/nondet env main-input body)
  (define free-stack (stack-make))
  (define blocks (node-children env))

  (debug "")
  (debug "-------------------------")
  (debug "GOT: ~a" (get-head 100 body))

  (define (with-initialization fn)
    (lambda (block)
      (and
       (initialize-rewrite-block free-stack block main-input)
       (let ((ret (fn free-stack block main-input)))
         (uninitialize-rewrite-block free-stack block main-input)
         ret))))

  (define result
    (if (not (list-and-map check-rewrite-block blocks)) '()
        (let ((re-match-threads
               (let loop ((match-threads (list (get-current-match-thread)))
                          (blocks blocks))
                 (if (null? blocks) match-threads
                     (let ((cur (car blocks)))
                       (define new-match-threads
                         (list-map/flatten
                          (match-thread-relative
                           ((with-initialization match-rewrite-block/nondet) cur))
                          match-threads))
                       (loop new-match-threads (cdr blocks)))))))

          (debug-show-variable-bindings free-stack re-match-threads)

          (define re-threads
            (map
             (match-thread-relative
              (thread-fork
               (for-each (with-initialization rewrite-rewrite-block/nondet) blocks)
               (get-current-thread)))
             re-match-threads))

          re-threads)))

  ;; (debugv (length result))

  ;; (debug-show-variable-bindings free-stack result)

  (for-each soft-uninitialize-variable!
            (stack->list free-stack))

  (if (null? result) '()
      (let ((hook (eval-hook)))
        (when hook
          (for-each (match-thread-relative (hook body)) result))
        (debug "END: ~s matches" (length result))
        result)))
