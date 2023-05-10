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
  (define-module (variable-get-association-or-nondet)
    :export (variable-get-association-or-nondet)
    :use-module ((euphrates prefixtree) :select (prefixtree-ref-furthest))
    :use-module ((get-current-match-thread) :select (get-current-match-thread))
    :use-module ((node) :select (node-binding))
    :use-module ((thread-obj) :select (thread-obj-lst))
    )))



(define (variable-get-association-or-nondet node default)
  (let* ((match-thread (get-current-match-thread))
         (lst (thread-obj-lst match-thread))
         (pt (node-binding node))
         (ret (and pt (prefixtree-ref-furthest pt lst))))
    (if (or (equal? ret 'uninitialized-prefixtree-from-associate-variable!/det)
            (not ret))
        default
        ret)))
