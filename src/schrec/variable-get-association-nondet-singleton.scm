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
  (define-module (schrec variable-get-association-nondet-singleton)
    :export (variable-get-association-nondet-singleton)
    :use-module ((euphrates list-singleton-q) :select (list-singleton?))
    :use-module ((euphrates prefixtree) :select (prefixtree-ref-furthest))
    :use-module ((get-current-match-thread) :select (get-current-match-thread))
    :use-module ((node) :select (node-binding))
    :use-module ((thread-obj) :select (thread-obj-lst))
    )))



(define (list-singleton? L)
  (and (not (null? L))
       (null? (cdr L))))

(define (variable-get-association-nondet-singleton node default default-if-not-singleton)
  (let* ((match-thread (get-current-match-thread))
         (lst (thread-obj-lst match-thread))
         (pt (node-binding node))
         (ret (and pt (prefixtree-ref-furthest pt lst))))
    (if (and ret
             (not (equal? ret 'uninitialized-prefixtree-from-associate-variable!/det)))
        (if (list-singleton? ret)
            (car ret)
            default-if-not-singleton)
        default)))
