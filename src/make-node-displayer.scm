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

%var make-node-displayer

%use (~a) "./euphrates/tilda-a.scm"
%use (exp-node?) "./exp-node-huh.scm"
%use (node-label node-namespace) "./node.scm"

(define (make-node-displayer)
  (define counter 0)
  (lambda (existing node)
    (if (< 0 existing)
        (string->symbol
         (string-append
          (symbol->string (node-label node)) "." (~a (node-namespace node))))
        (if (exp-node? node)
            (begin
              (set! counter (+ 1 counter))
              (string->symbol (string-append "$" (~a counter))))
            (node-label node)))))

