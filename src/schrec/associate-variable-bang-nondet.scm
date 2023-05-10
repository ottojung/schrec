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
  (define-module (associate-variable-bang-nondet)
    :export (associate-variable!/det/nondet)
    :use-module ((euphrates prefixtree) :select (make-prefixtree prefixtree-set!))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((euphrates stack) :select (stack-push!))
    :use-module ((get-current-match-thread) :select (get-current-match-thread))
    :use-module ((node) :select (node-binding set-node-binding!))
    :use-module ((thread-obj) :select (thread-obj-lst))
    :use-module ((variable-associated-huh-nondet) :select (variable-associated?/nondet))
    )))



(define (associate-variable!/det/nondet free-stack node vals)
  (if (variable-associated?/nondet node)
      (raisu 'already-associated node vals)
      (let* ((match-thread (get-current-match-thread))
             (lst (thread-obj-lst match-thread))
             (pt (or (node-binding node)
                     (let ((new (make-prefixtree 'uninitialized-prefixtree-from-associate-variable!/det)))
                       (set-node-binding! node new)
                       new))))
        (stack-push! free-stack node)
        (prefixtree-set! pt lst vals))))
