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
  (define-module (glisp encode-graph)
    :export (encode-graph)
    :use-module ((schrec pretty-print-graph) :select (pretty-print-graph))
    :use-module ((builtins) :select (1f f-car f-cdr f-cons f-null progn set))
    :use-module ((helpers) :select (concat flatten foreach-child in-children? index-of intersperse make-singleton reverse-children separator))
    :use-module ((order-nodes) :select (order-nodes))
    )))



;;;;;;;;;;;;;;;;
;; Main logic ;;
;;;;;;;;;;;;;;;;

(define flat-adjlist->tape
  (lambda (ordered-nodes x)
    (1f (null? x) x
        (progn
         (define first (f-car x))
         (define encoded-first
           (1f (eq? first separator)
               (make-singleton separator)
               (index-of ordered-nodes first)))
         (concat
          encoded-first
          (flat-adjlist->tape
           ordered-nodes (f-cdr x)))))))

(define graph->adjlist
  (lambda (g)
    (define return (f-null))
    (define visited-list (f-null))

    (define add-to-return
      (lambda (node)
        (set return (f-cons node return))))
    (define add-to-visited
      (lambda (node)
        (set visited-list (f-cons node visited-list))))

    (define loop
      (lambda (g)
        (define consed (f-cons g g))
        (1f (null? (in-children? visited-list g))
            (f-null)
            (progn
             (add-to-return consed)
             (add-to-visited g)
             (foreach-child loop g)))))

    (loop g)

    (reverse-children return)))

(define encode-graph
  (lambda (g)
    (define ordered-nodes (order-nodes g))

    (pretty-print-graph ordered-nodes) (newline)

    (define adjlist (graph->adjlist g))

    (pretty-print-graph adjlist) (newline)

    (define separated
      (intersperse (make-singleton separator) adjlist))

    (pretty-print-graph separated) (newline)

    (define flat
      (flatten separated))

    (pretty-print-graph flat) (newline)

    (define bin
      (flat-adjlist->tape ordered-nodes flat))

    (pretty-print-graph bin) (newline)

    bin))
