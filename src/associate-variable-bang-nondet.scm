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

%var associate-variable!/nondet

%use (raisu) "./euphrates/raisu.scm"
%use (stack-push!) "./euphrates/stack.scm"
%use (make-prefixtree prefixtree-set! prefixtree-ref-furthest) "./euphrates/prefixtree.scm"

%use (node-binding set-node-binding!) "./node.scm"
%use (variable-associated?/nondet) "./variable-associated-huh-nondet.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (thread-obj-lst) "./thread-obj.scm"
%use (const-variable?) "./const-variable-huh.scm"

(define (associate-variable!/nondet free-stack node vals)
  (if (variable-associated?/nondet node)
      (if (const-variable? node)
          (raisu 'trying-to-associate-a-constant node vals)
          (raisu 'already-associated node vals))
      (let* ((thread (get-current-thread))
             (lst (thread-obj-lst thread))
             (pt (or (node-binding node)
                     (let ((new (make-prefixtree 'uninitialized-prefixtree-from-associate-variable!)))
                       (set-node-binding! node new)
                       new))))
        (stack-push! free-stack node)
        (prefixtree-set! pt lst vals))))
