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

%var separator
%var bit0
%var bit1
%var true-node
%var false-node
%var make-singleton
%var concat
%var copy-children
%var flatten-children
%var foreach-child
%var equal-children?
%var n-zero
%var n-successor
%var n-pred
%var n-zero?
%var n-one
%var n-one?
%var monus
%var index-of
%var child-ref
%var make-n-fresh-nodes
%var c-member?
%var reverse-children
%var children-count

%use (pretty-print-graph) "./schrec/pretty-print-graph.scm"
%use (defvar f-car f-cdr f-cons f-null if-eq? if-null? if-true? make-named-node progn) "./builtins.scm"

(defvar separator (make-named-node '/))
(defvar bit0 (make-named-node 'o))
(defvar bit1 (make-named-node '+))

(defvar true-node (f-null))
(defvar false-node (f-cons true-node true-node))

(define (make-singleton x)
  (f-cons x (f-null)))

(define (concat left right)
  (if-null? left right
            (f-cons (f-car left)
                    (concat (f-cdr left) right))))

(define (copy-children x)
  (f-cons (f-car x) (f-cdr x)))

(define (flatten-children x)
  (if-null? x (f-null)
            (concat
             (f-car x)
             (flatten-children (f-cdr x)))))

(define (foreach-child func collection-node)
  (if-null?
   collection-node
   (f-null)
   (progn
    (func (f-car collection-node))
    (foreach-child func (f-cdr collection-node)))))

;; Shallow comparison, only 1 level deep.
(define (equal-children? a b)
  (if-null? a
            (if-null? b
                      true-node
                      false-node)
            (if-null? b
                      false-node
                      (if-eq? (f-car a)
                              (f-car b)
                              (equal-children?
                               (f-cdr a) (f-cdr b))
                              false-node))))

(define (n-zero)
  (make-singleton bit0))

(define (n-successor n)
  (f-cons bit1 n))

(define (n-pred n)
  (f-cdr n))

(define (n-zero? n)
  (equal-children? n (n-zero)))

(define (n-one)
  (n-successor (n-zero)))

(define (n-one? n)
  (equal-children? n (n-one)))

;; Subtraction bounded by zero.
;; So that monus(5, 3) is 2, but monus(5, 10) is 0.
(define (monus a b)
  (if-true? (n-zero? b)
            a
            (if-true? (n-zero? a)
                      (n-zero)
                      (monus (n-pred a) (n-pred b)))))

;; Starts from 1.
;; If element is not found, returns the length of the list + 1.
(define (index-of collection-node element)
  (if-null?
   collection-node
   (n-one)
   (if-eq? element (f-car collection-node)
           (n-one)
           (n-successor
            (index-of (f-cdr collection-node)
                      element)))))

(define (child-ref collection-node index)
  (if-null?
   collection-node
   (f-null)
   (if-true?
    (n-one? index)
    (f-car collection-node)
    (child-ref (f-cdr collection-node)
               (n-pred index)))))

(define (make-n-fresh-nodes n)
  (if-true? (n-zero? n)
            (f-null)
            (f-cons (f-null)
                    (make-n-fresh-nodes
                     (n-pred n)))))

(define (c-member? collection-node item-node)
  (if-null?
   collection-node false-node
   (progn
    (defvar first (f-car collection-node))
    (if-eq?
     first item-node
     true-node
     (c-member?
      (f-cdr collection-node) item-node)))))

(define (reverse-children x)
  (define (loop x buf)
    (if-null? x buf
              (loop (f-cdr x)
                    (f-cons (f-car x) buf))))

  (loop x (f-null)))

(define (children-count x)
  (if-null? x (n-zero)
            (n-successor (children-count (f-cdr x)))))
