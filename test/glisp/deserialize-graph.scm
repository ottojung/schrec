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

%var deserialize-graph

%use (pretty-print-graph) "./schrec/pretty-print-graph.scm"
%use (f-car f-cdr f-cons f-null if-eq? if-null? if-true? progn set) "./builtins.scm"
%use (bit0 child-ref children-count concat false-node make-n-fresh-nodes monus n-successor n-zero reverse-children separator true-node) "./helpers.scm"

(define read-number
  (lambda (collection-node)
    (define head (f-car collection-node))
    (set collection-node
         (f-cdr collection-node))

    (if-eq? head bit0
            (n-zero)
            (n-successor
             (read-number collection-node)))))

(define another-node?
  (lambda (collection-node)
    (define head (f-car collection-node))
    (if-eq? head separator
            false-node
            true-node)))

(define skip-separator
  (lambda (collection-node)
    (set collection-node (f-cdr collection-node))))

(define count-nodes
  (lambda (g)
    (if-null? g (n-zero)
              (if-eq? (f-car g) separator
                      (n-successor (count-nodes (f-cdr g)))
                      (count-nodes (f-cdr g))))))

(define create-fresh-nodes
  (lambda (ordered-nodes g)
    (define node-count (count-nodes g))
    (define old-nodes-count (children-count ordered-nodes))

    ;; NOTE: add 1 because indexing from 1.
    (define new-nodes-count
      (n-successor (monus node-count old-nodes-count)))

    (make-n-fresh-nodes new-nodes-count)))

(define deserialize-graph
  (lambda (ordered-nodes g)
    (define (add-to-return current current-children)
      (define children (reverse-children current-children))
      (set current children))

    (define all-nodes
      (concat ordered-nodes
              (create-fresh-nodes ordered-nodes g)))

    (define get-node
      (lambda ()
        (define n (read-number g))
        (define v (child-ref all-nodes n))
        v))

    (define root (get-node))

    (define loop
      (lambda (current current-children)
        (if-true? (another-node? g)
                  (progn
                   (define v (get-node))
                   (loop current (f-cons v current-children)))
                  (progn
                   (skip-separator g)
                   (add-to-return current current-children)
                   (if-null? g (f-null)
                             (loop (get-node) (f-null)))))))

    (loop root (f-null))

    root
    ))
