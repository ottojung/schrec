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

%var f-null
%var f-cons
%var f-car
%var f-cdr
%var if-null?
%var if-eq?
%var set
%var progn
%var eval-node
%var make-named-node

%use (raisu) "./schrec/euphrates/raisu.scm"
%use (eval-multi-node?) "./schrec/eval-multi-node-huh.scm"
%use (make-fresh-atom-node) "./schrec/make-fresh-atom-node.scm"
%use (make-fresh-branch-node) "./schrec/make-fresh-branch-node.scm"
%use (node-equal?) "./schrec/node-equal-huh.scm"
%use (node-children set-node-children!) "./schrec/node.scm"

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

(define-syntax if-null?
  (syntax-rules ()
    ((_ exp then else)
     (if (null? (node-children exp)) then else))))

(define-syntax if-eq?
  (syntax-rules ()
    ((_ a b then else)
     (if (or (and (eval-multi-node? a)
                  (eval-multi-node? b))
             (node-equal? a b))
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
