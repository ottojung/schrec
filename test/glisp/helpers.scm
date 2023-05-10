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
  (define-module (helpers)
    :export (separator bit0 bit1 true-node false-node make-singleton concat copy-children flatten intersperse foreach-child equal-children? n-zero n-successor n-pred n-zero? n-one n-one? monus index-of child-ref make-n-fresh-nodes in-children? reverse-children children-count)
    :use-module ((builtins) :select (1f f-car f-cdr f-cons f-null make-named-node progn))
    )))



(define separator (make-named-node '/))
(define bit0 (make-named-node 'o))
(define bit1 (make-named-node '+))

(define true-node (f-null))
(define false-node (f-cons true-node true-node))

(define make-singleton
  (lambda (x)
    (f-cons x (f-null))))

(define concat
  (lambda (left right)
    (1f (null? left) right
        (f-cons (f-car left)
                (concat (f-cdr left) right)))))

(define copy-children
  (lambda (x)
    (f-cons (f-car x) (f-cdr x))))

(define flatten
  (lambda (x)
    (1f (null? x) x
        (concat
         (f-car x)
         (flatten (f-cdr x))))))

(define intersperse
  (lambda (separator list)
    (1f (null? list) list
        (f-cons
         (f-car list)
         (f-cons
          separator
          (intersperse
           separator (f-cdr list)))))))

(define foreach-child
  (lambda (func list)
    (1f (null? list) list
        (progn
         (func (f-car list))
         (foreach-child func (f-cdr list))))))

;; Shallow comparison, only 1 level deep.
(define equal-children?
  (lambda (a b)
    (1f (null? a)
        (1f (null? b)
            true-node
            false-node)
        (1f (null? b)
            false-node
            (1f (eq? (f-car a) (f-car b))
                (equal-children?
                 (f-cdr a) (f-cdr b))
                false-node)))))

(define n-zero
  (lambda ()
    (make-singleton bit0)))

(define n-successor
  (lambda (n)
    (f-cons bit1 n)))

(define n-pred
  (lambda (n)
    (f-cdr n)))

(define n-zero?
  (lambda (n)
    (equal-children? n (n-zero))))

(define n-one
  (lambda ()
    (n-successor (n-zero))))

(define n-one?
  (lambda (n)
    (equal-children? n (n-one))))

;; Subtraction bounded by zero.
;; So that monus(5, 3) is 2, but monus(5, 10) is 0.
(define monus
  (lambda (a b)
    (1f (null? (n-zero? b)) a
        (1f (null? (n-zero? a))
            (n-zero)
            (monus (n-pred a) (n-pred b))))))

;; Starts from 1.
;; If element is not found, returns the length of the list + 1.
(define index-of
  (lambda (list element)
    (1f (null? list)
        (n-one)
        (1f (eq? element (f-car list))
            (n-one)
            (n-successor
             (index-of (f-cdr list)
                       element))))))

(define child-ref
  (lambda (list index)
    (1f (null? list) list
        (1f (null? (n-one? index))
            (f-car list)
            (child-ref (f-cdr list)
                       (n-pred index))))))

(define make-n-fresh-nodes
  (lambda (n)
    (1f (null? (n-zero? n))
        (f-null)
        (f-cons (f-null)
                (make-n-fresh-nodes
                 (n-pred n))))))

(define in-children?
  (lambda (list item-node)
    (1f (null? list)
        false-node
        (progn
         (define first (f-car list))
         (1f (eq? first item-node)
             true-node
             (in-children?
              (f-cdr list) item-node))))))

(define reverse-children
  (lambda (x)
    (define loop
      (lambda (x buf)
        (1f (null? x) buf
            (loop (f-cdr x)
                  (f-cons (f-car x) buf)))))
    (loop x (f-null))))

(define children-count
  (lambda (x)
    (1f (null? x) (n-zero)
        (n-successor (children-count (f-cdr x))))))
