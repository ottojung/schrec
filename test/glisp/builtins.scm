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
  (define-module (glisp builtins)
    :export (f-null f-cons f-car f-cdr #{1f}# set progn eval-node make-named-node)
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec eval-multi-node-huh) :select (eval-multi-node?))
    :use-module ((schrec make-fresh-atom-node) :select (make-fresh-atom-node))
    :use-module ((schrec make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((schrec node-equal-huh) :select (node-equal?))
    :use-module ((schrec node) :select (node-children set-node-children!))
    )))



;;;;;;;;;;;;;;
;; Builtins ;;
;;;;;;;;;;;;;;

(define (f-null)
  (make-fresh-branch-node '()))

(define (f-cons left right)
  (define return (f-null))
  (set-node-children!
   return
   (cons left (node-children right)))
  return)

(define (f-car x)
  (when (null? (node-children x))
    (raisu 'null-car-children x))

  (car (node-children x)))

(define (f-cdr x)
  (define return (f-null))

  (when (null? (node-children x))
    (raisu 'null-tail-children x))

  (set-node-children! return (cdr (node-children x)))

  return)

(define-syntax 1f
  (syntax-rules (eq? null?)
    ((_ (eq? a-exp b-exp) then else)
     (let ((a a-exp)
           (b b-exp))
       (if (or (and (eval-multi-node? a)
                    (eval-multi-node? b))
               (node-equal? a b))
           then else)))
    ((_ (null? exp) then else)
     (if (null? (node-children exp))
         then else))))

(define (set x y)
  (set-node-children! x (node-children y)))

(define-syntax progn
  (syntax-rules ()
    ((_ . bodies) (let* () . bodies))))

;; NOTE: compiled into equivalent node.
(define eval-node
  (make-fresh-atom-node 'eval 0))

(define (make-named-node name)
  (make-fresh-atom-node name 0))
