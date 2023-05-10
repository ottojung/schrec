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
  (define-module (make-node-displayer)
    :export (make-node-displayer)
    :use-module ((euphrates ihashmap) :select (hashmap-ref hashmap-set! make-hashmap))
    :use-module ((euphrates tilda-a) :select (~a))
    :use-module ((named-node-huh) :select (named-node?))
    :use-module ((node) :select (node-id node-label node-namespace))
    )))



(define (make-node-displayer)
  (define counter 0)
  (define nonexp-counters (make-hashmap))
  (lambda (node)
    (define localid (if (named-node? node) (node-label node) (node-id node)))
    (define existing (hashmap-ref nonexp-counters localid 0))
    (hashmap-set! nonexp-counters localid (+ 1 existing))

    (if (< 0 existing)
        (string->symbol
         (string-append
          (symbol->string (node-label node)) "." (~a (node-namespace node))))
        (if (named-node? node)
            (node-label node)
            (begin
              (set! counter (+ 1 counter))
              (string->symbol (string-append "$" (~a counter))))))))
