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

%var decode-graph

%use (1f f-car f-cdr f-cons f-null progn set) "./builtins.scm"
%use (child-ref children-count concat false-node make-n-fresh-nodes make-singleton monus n-successor n-zero n-zero? reverse-children separator true-node) "./helpers.scm"

(define read-number
  (lambda (tape)
    (define head (f-car tape))
    (set tape (f-cdr tape))

    (1f (null? (n-zero? (make-singleton head)))
        (n-zero)
        (n-successor
         (read-number tape)))))

(define separator-next?
  (lambda (tape)
    (define head (f-car tape))
    (1f (eq? head separator)
        true-node
        false-node)))

(define skip-separator
  (lambda (tape)
    (set tape (f-cdr tape))))

(define count-nodes
  (lambda (g)
    (1f (null? g) (n-zero)
        (1f (eq? (f-car g) separator)
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

(define decode-graph
  (lambda (ordered-nodes g)
    (define add-to-return
      (lambda (current current-children)
        (define children (reverse-children current-children))
        (set current children)))

    (define all-nodes
      (concat ordered-nodes
              (create-fresh-nodes ordered-nodes g)))

    (define read-node
      (lambda ()
        (define n (read-number g))
        (define v (child-ref all-nodes n))
        v))

    (define root (read-node))

    (define loop
      (lambda (current current-children)
        (1f (null? (separator-next? g))
            (progn
             (skip-separator g)
             (add-to-return current current-children)
             (1f (null? g) g
                 (loop (read-node) (f-null))))
            (progn
             (define v (read-node))
             (loop current (f-cons v current-children))))))

    (loop root (f-null))

    root
    ))
