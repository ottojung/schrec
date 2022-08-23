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

%var associate-variable!/det/nondet

%use (make-prefixtree prefixtree-ref-furthest prefixtree-set!) "./euphrates/prefixtree.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (stack-push!) "./euphrates/stack.scm"
%use (const-variable?) "./const-variable-huh.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (node-binding set-node-binding!) "./node.scm"
%use (thread-obj-lst) "./thread-obj.scm"
%use (variable-associated?/nondet) "./variable-associated-huh-nondet.scm"

(define (associate-variable!/det/nondet free-stack node vals)
  (if (variable-associated?/nondet node)
      (if (const-variable? node)
          (raisu 'trying-to-associate-a-constant node vals)
          (raisu 'already-associated node vals))
      (let* ((match-thread (get-current-match-thread))
             (lst (thread-obj-lst match-thread))
             (pt (or (node-binding node)
                     (let ((new (make-prefixtree 'uninitialized-prefixtree-from-associate-variable!/det)))
                       (set-node-binding! node new)
                       new))))
        (stack-push! free-stack node)
        (prefixtree-set! pt lst vals))))
