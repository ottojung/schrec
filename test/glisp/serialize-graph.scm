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

%var serialize-graph

%use (pretty-print-graph) "./schrec/pretty-print-graph.scm"
%use (f-car f-cdr f-cons f-null if-eq? if-null? if-true? progn set) "./builtins.scm"
%use (c-member? concat flatten-children foreach-child index-of make-singleton reverse-children separator) "./helpers.scm"
%use (order-nodes) "./order-nodes.scm"

;;;;;;;;;;;;;;;;
;; Main logic ;;
;;;;;;;;;;;;;;;;

(define to-binary
  (lambda (ordered-nodes x)
    (if-null? x (f-null)
              (progn
               (define first (f-car x))
               (define m
                 (if-eq? first separator
                         (make-singleton separator)
                         (index-of ordered-nodes first)))
               (concat
                m (to-binary ordered-nodes (f-cdr x)))))))

(define intersperse-adjlist-with-separators
  (lambda (adjlist)
    (if-null? adjlist
              (f-null)
              (f-cons
               (f-car adjlist)
               (f-cons
                (make-singleton separator)
                (intersperse-adjlist-with-separators
                 (f-cdr adjlist)))))))

(define graph->adjlist
  (lambda (g)
    (define return (f-null))
    (define visited-list (f-null))

    (define (add-to-return node)
      (set return (f-cons node return)))
    (define (add-to-visited node)
      (set visited-list (f-cons node visited-list)))

    (define loop
      (lambda (g)
        (define consed (f-cons g g))
        (if-true?
         (c-member? visited-list g)
         (f-null)
         (progn
          (add-to-return consed)
          (add-to-visited g)
          (foreach-child loop g)))))

    (loop g)

    (reverse-children return)))

(define serialize-graph
  (lambda (g)
    (define ordered-nodes (order-nodes g))

    (pretty-print-graph ordered-nodes) (newline)

    (define adjlist (graph->adjlist g))

    (pretty-print-graph adjlist) (newline)

    (define conc
      (intersperse-adjlist-with-separators adjlist))

    (pretty-print-graph conc) (newline)

    (define flat
      (flatten-children conc))

    (pretty-print-graph flat) (newline)

    (define bin
      (to-binary ordered-nodes flat))

    (pretty-print-graph bin) (newline)

    bin))
