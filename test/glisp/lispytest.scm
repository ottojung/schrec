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
  (define-module (glisp lispytest)
    :use-module ((schrec pretty-print-graph) :select (pretty-print-graph))
    :use-module ((builtins) :select (f-null set))
    :use-module ((decode-graph) :select (decode-graph))
    :use-module ((helpers) :select (foreach-child))
    :use-module ((input) :select (input))
    :use-module ((order-nodes) :select (order-nodes))
    :use-module ((encode-graph) :select (encode-graph))
    )))


(define main
  (lambda ()
    (pretty-print-graph input) (newline)

    (define serialized
      (encode-graph input))

    ;; (define ordered
    ;;   (f-cons (f-null) (f-null)))

    ;; (define ordered
    ;;   (f-null))

    (define ordered
      (order-nodes input))

    (foreach-child (lambda (x) (set x (f-null))) ordered)
    (pretty-print-graph ordered) (newline)

    (define deser
      (decode-graph ordered serialized))

    (pretty-print-graph deser) (newline)

    (values)))

(main)
