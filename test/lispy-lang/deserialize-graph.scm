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
%use (defvar f-car f-cdr f-cons f-null if-eq? if-null? if-true? progn set) "./builtins.scm"
%use (bit0 child-ref children-count concat false-node make-n-fresh-nodes monus n-successor n-zero reverse-children separator true-node) "./helpers.scm"

(define (read-number collection-node)
  (defvar head (f-car collection-node))
  (set collection-node
       (f-cdr collection-node))

  (if-eq? head bit0
          (n-zero)
          (n-successor
           (read-number collection-node))))

(define (another-node? collection-node)
  (defvar head (f-car collection-node))
  (if-eq? head separator
          false-node
          true-node))

(define (skip-separator collection-node)
  (set collection-node (f-cdr collection-node)))

(define (count-nodes g)
  (if-null? g (n-zero)
            (if-eq? (f-car g) separator
                    (n-successor (count-nodes (f-cdr g)))
                    (count-nodes (f-cdr g)))))

(define (create-fresh-nodes ordered-nodes g)
  (defvar node-count (count-nodes g))
  (defvar old-nodes-count (children-count ordered-nodes))

  ;; NOTE: add 1 because indexing from 1.
  (defvar new-nodes-count
    (n-successor (monus node-count old-nodes-count)))

  (make-n-fresh-nodes new-nodes-count))

(define (deserialize-graph ordered-nodes g)
  (define (add-to-return current current-children)
    (defvar children (reverse-children current-children))
    (set current children))

  (defvar all-nodes
    (concat ordered-nodes
            (create-fresh-nodes ordered-nodes g)))

  (define (get-node)
    (defvar n (read-number g))
    (defvar v (child-ref all-nodes n))
    v)

  (defvar root (get-node))

  (define (loop current current-children)
    (if-true? (another-node? g)
              (progn
               (defvar v (get-node))
               (loop current (f-cons v current-children)))
              (progn
               (skip-separator g)
               (add-to-return current current-children)
               (if-null? g (f-null)
                         (loop (get-node) (f-null))))))

  (loop root (f-null))

  root
  )
