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

%use (list-singleton?) "./schrec/euphrates/list-singleton-q.scm"
%use (raisu) "./schrec/euphrates/raisu.scm"
%use (eval-multi-node?) "./schrec/eval-multi-node-huh.scm"
%use (list->graph) "./schrec/list-to-graph.scm"
%use (make-fresh-atom-node) "./schrec/make-fresh-atom-node.scm"
%use (make-fresh-branch-node) "./schrec/make-fresh-branch-node.scm"
%use (node-equal?) "./schrec/node-equal-huh.scm"
%use (node-children set-node-children!) "./schrec/node.scm"
%use (pretty-print-graph) "./schrec/pretty-print-graph.scm"

;; (define example
;;   '(let ((a (m m))
;;          (m (a)))
;;      a))

     ;; (eval g (((m a b) g (m x) (b m)))
     ;;       (let ((a ()))
     ;;         (m a)))))

(define example
  '(a (b c eval d) e))

(define input
  (list->graph example))

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

(define-syntax defvar
  (syntax-rules ()
    ((_ name value) (define name value))))

(define-syntax progn
  (syntax-rules ()
    ((_ . bodies) (let* () . bodies))))

(define-syntax if-true?
  (syntax-rules ()
    ((_ exp then else)
     (if-null? exp then else))))

;; NOTE: compiled into equivalent node.
(define eval-node
  (make-fresh-atom-node 'eval 0))

;;;;;;;;;;;;;
;; Helpers ;;
;;;;;;;;;;;;;

(defvar true-node (f-null))
(defvar false-node (f-cons true-node true-node))

(define (f-append left right)
  (f-cons (f-car left) right))

(define (f-head x)
  (f-cons (f-car x) (f-null)))

(define (make-singleton x)
  (f-cons x (f-null)))

(define (concat left right)
  (define (loop left)
    (if-null? left right
              (f-append (f-head left)
                        (loop (f-cdr left)))))
  (loop left))

(define (copy-children x)
  (f-append (f-head x) (f-cdr x)))

(define (flatten-children x)
  (define (loop x)
    (if-null? x (f-null)
              (concat
               (f-car x)
               (loop (f-cdr x)))))
  (loop x))

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
  (make-singleton digit3))

(define (n-successor n)
  (f-cons digit2 n))

(define (n-pred n)
  (f-cdr n))

(define (n-zero? n)
  (equal-children? n (n-zero)))

(define (n-one)
  (n-successor (n-zero)))

(define (n-one? n)
  (equal-children? n (n-one)))

;;;;;;;;;;;;;;;;
;; Main logic ;;
;;;;;;;;;;;;;;;;

(defvar separator (make-fresh-atom-node '/ 0))
(defvar digit2 (make-fresh-atom-node '+ 0))
(defvar digit3 (make-fresh-atom-node 'o 0))

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

;; Always puts eval node first.
(define (order-nodes graph)
  (defvar visited-list (f-null))

  (define (add-to-visited node)
    (set visited-list (f-cons node visited-list)))

  (define (loop g)
    (defvar consed (f-cons g g))
    (if-true?
     (c-member? visited-list g)
     (f-null)
     (if-eq? eval-node g
             (progn
              (foreach-child loop g))
             (progn
              (add-to-visited g)
              (foreach-child loop g)))))

  (loop graph)

  (f-cons
   eval-node
   (reverse-children visited-list)))

(define (to-binary ordered-nodes x)
  (define (loop x)
    (if-null? x (f-null)
              (progn
               (defvar first (f-car x))
               (defvar m
                 (if-eq? first separator
                         (make-singleton separator)
                         (index-of ordered-nodes first)))
               (concat m (loop (f-cdr x))))))
  (loop x))

(define (split-by-separator bin)
  (defvar return (f-null))

  (define (add-to-return node)
    (set return (f-cons node return)))

  (define (loop bin collected)
    (if-null? bin (f-null)
              (progn
               (defvar first (f-car bin))
               (if-eq? first separator
                       (progn
                        (add-to-return (reverse-children collected))
                        (loop (f-cdr bin) (f-null)))
                       (progn
                        (loop (f-cdr bin)
                              (f-cons first collected)))))))

  (defvar rb
    (loop bin (f-null)))

  (defvar rev (reverse-children return))
  (pretty-print-graph rev) (newline)
  rev)

(define (intersperse-adjlist-with-separators adjlist)
  (defvar sep-list (make-singleton separator))

  (define (loop adjlist)
    (if-null? adjlist
              (f-null)
              (f-cons
               (f-car adjlist)
               (f-cons sep-list (loop (f-cdr adjlist))))))
  (loop adjlist))

(define (reverse-children x)
  (define (loop x buf)
    (if-null? x buf
              (loop (f-cdr x)
                    (f-append (f-head x) buf))))

  (loop x (f-null)))

(define (c-member? collection-node item-node)
  (define (loop collection-node)
    (if-null?
     collection-node false-node
     (progn
      (defvar first (f-car collection-node))
      (if-eq?
       first item-node
       true-node
       (loop (f-cdr collection-node))))))
  (loop collection-node))

(define (graph->adjlist g)
  (defvar return (f-null))
  (defvar visited-list (f-null))

  (define (add-to-return node)
    (set return (f-cons node return)))

  (define (loop g)
    (defvar consed (f-cons g g))
    (if-true?
     (c-member? visited-list g)
     (f-null)
     (progn
       (set visited-list (f-cons g visited-list))
       (add-to-return consed)
       (foreach-child loop g))))

  (loop g)

  (reverse-children return))

(define (serialize-graph g)
  (defvar ordered-nodes (order-nodes g))

  (pretty-print-graph ordered-nodes) (newline)

  (defvar adjlist (graph->adjlist g))

  (pretty-print-graph adjlist) (newline)

  (defvar conc
    (intersperse-adjlist-with-separators adjlist))

  (pretty-print-graph conc) (newline)

  (defvar flat
    (flatten-children conc))

  (pretty-print-graph flat) (newline)

  (defvar bin
    (to-binary ordered-nodes flat))

  (pretty-print-graph bin) (newline)

  bin)

(define (main)
  (pretty-print-graph input) (newline)

  (defvar serialized
    (serialize-graph input))

  ;; (defvar unserialized
  ;;   (deserialize-graph serialized))

  (defvar ordered
    (order-nodes input))

  (pretty-print-graph ordered) (newline)

  (values))

(main)
