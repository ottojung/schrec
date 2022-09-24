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

%use (pretty-print-graph) "./schrec/pretty-print-graph.scm"
%use (f-null set) "./builtins.scm"
%use (decode-graph) "./decode-graph.scm"
%use (foreach-child) "./helpers.scm"
%use (input) "./input.scm"
%use (order-nodes) "./order-nodes.scm"
%use (encode-graph) "./encode-graph.scm"

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
