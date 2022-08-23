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

%var variable-get-association-or-nondet

%use (make-prefixtree prefixtree-ref-furthest prefixtree-set!) "./euphrates/prefixtree.scm"
%use (const-variable?) "./const-variable-huh.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (node-binding) "./node.scm"
%use (thread-obj-lst) "./thread-obj.scm"

(define (variable-get-association-or-nondet node default)
  (if (const-variable? node) (list node)
      (let* ((match-thread (get-current-match-thread))
             (lst (thread-obj-lst match-thread))
             (pt (node-binding node))
             (ret (and pt (prefixtree-ref-furthest pt lst))))
        (if (or (equal? ret 'uninitialized-prefixtree-from-associate-variable!/det)
                (not ret))
            default
            ret))))
