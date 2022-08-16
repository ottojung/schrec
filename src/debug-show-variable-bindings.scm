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

%var debug-show-variable-bindings

%use (variable-get-association-or/nondet) "./variable-get-association-or-nondet.scm"
%use (words->string) "./euphrates/words-to-string.scm"
%use (list-intersperse) "./euphrates/list-intersperse.scm"
%use (dprintln) "./euphrates/dprintln.scm"
%use (~s) "./euphrates/tilda-s.scm"
%use (stack-make stack->list) "./euphrates/stack.scm"
%use (list-deduplicate/reverse) "./euphrates/list-deduplicate.scm"

%use (match-thread-relative) "./match-thread-relative.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (get-head) "./get-head.scm"

(define (debug-show-variable-bindings free-stack result)
  (define vars
    (list-deduplicate/reverse
     (stack->list free-stack)))

  (for-each
   (match-thread-relative
    (dprintln "\nTH: ~s" (get-current-match-thread))
    (for-each
     (lambda (var)
       (define ass (variable-get-association-or/nondet var #f))
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
