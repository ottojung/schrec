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
  (define-module (schrec debug-show-variable-bindings)
    :export (debug-show-variable-bindings)
    :use-module ((euphrates dprintln) :select (dprintln))
    :use-module ((euphrates list-deduplicate) :select (list-deduplicate/reverse))
    :use-module ((euphrates list-intersperse) :select (list-intersperse))
    :use-module ((euphrates stack) :select (stack->list))
    :use-module ((euphrates tilda-s) :select (~s))
    :use-module ((schrec get-current-match-thread) :select (get-current-match-thread))
    :use-module ((schrec get-head) :select (get-head))
    :use-module ((schrec match-thread-relative) :select (match-thread-relative))
    :use-module ((schrec variable-get-association-or-nondet) :select (variable-get-association-or-nondet))
    )))



(define (debug-show-variable-bindings free-stack result)
  (define vars
    (list-deduplicate/reverse
     (stack->list free-stack)))

  (for-each
   (match-thread-relative
    (dprintln "\nTH: ~s" (get-current-match-thread))
    (for-each
     (lambda (var)
       (define ass (variable-get-association-or-nondet var #f))
       (when ass
         (dprintln
          "~s -> ~a"
          (get-head 4 var)
          (apply
           string-append
           (list-intersperse
            ", " (map (lambda (n) (~s (get-head 4 n))) ass))))))
     vars))
   result))
