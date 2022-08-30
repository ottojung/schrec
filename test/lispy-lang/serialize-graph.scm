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
  '(a (b c d eval) (e c f)))

(define input
  (list->graph example))

;;;;;;;;;;;;;;
;; Builtins ;;
;;;;;;;;;;;;;;

(define (f-car x)
  (when (null? (node-children x))
    (raisu 'null-car-children x))

  (car (node-children x)))

(define (f-new)
  (make-fresh-branch-node '()))

(define (f-cons left right)
  (define return (f-new))
  (set-node-children!
   return
   (cons left (node-children right)))
  return)

(define (f-append left right)
  (define return (f-new))

  (unless (list-singleton? (node-children left))
    (raisu 'not-singleton! left))

  (set-node-children!
   return
   (cons (car (node-children left))
         (node-children right)))

  return)

(define (f-head x)
  (define return (f-new))

  (when (null? (node-children x))
    (raisu 'null-head-children x))

  (set-node-children!
   return (list (car (node-children x))))

  return)

(define (f-tail x)
  (define return (f-new))

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
     (if (node-equal? a b) then else))))

;; NOTE: compiled into equivalent `(if (eq? eval-node x) then else))` code.
(define-syntax if-eval-node?
  (syntax-rules ()
    ((_ x then else)
     (if (eval-multi-node? x) then else))))

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

;;;;;;;;;;;;;
;; Helpers ;;
;;;;;;;;;;;;;

(defvar true-node (f-new))
(defvar false-node (f-cons true-node true-node))

(define (make-singleton x)
  (defvar return (f-new))
  (set! return (f-cons x return))
  return)

(define (concat left right)
  (let loop ((left left))
    (if-null? left right
              (f-append (f-head left)
                        (loop (f-tail left))))))

(define (copy-children x)
  (f-append (f-head x) (f-tail x)))

(define (flatten-children x)
  (define (loop x)
    (if-null? x (f-new)
              (concat
               (f-car x)
               (loop (f-tail x)))))
  (loop x))

;;;;;;;;;;;;;;;;
;; Main logic ;;
;;;;;;;;;;;;;;;;

(defvar separator (make-fresh-atom-node '/ 0))
(defvar digit0 (make-fresh-atom-node 'o 0))
(defvar digit1 (make-fresh-atom-node 'i 0))

(define (to-binary x)
  (define (loop x)
    (if-null? x (f-new)
              (progn
               (defvar first (f-car x))
               (defvar m
                 (if-eq? first separator
                         separator
                         (if-eval-node? first
                                        digit1
                                        digit0)))
               (defvar mlist
                 (make-singleton m))
               (f-append mlist (loop (f-tail x))))))
  (loop x))

(define (split-by-separator bin)
  (defvar return (f-new))

  (define (add-to-return node)
    (set! return (f-cons node return)))

  (define (loop bin collected)
    (if-null? bin (f-new)
              (progn
               (defvar first (f-car bin))
               (if-eq? first separator
                       (progn
                        (add-to-return (reverse-children collected))
                        (loop (f-tail bin) (f-new)))
                       (progn
                        (loop (f-tail bin)
                              (f-cons first collected)))))))

  (defvar rb
    (loop bin (f-new)))

  (defvar rev (reverse-children return))
  (pretty-print-graph rev) (newline)
  rev)

(define (intersperse-adjlist-with-separators adjlist)
  (defvar sep-list (make-singleton separator))

  (define (loop adjlist)
    (if-null? adjlist
              (f-new)
              (concat
               (f-head adjlist)
               (f-cons sep-list (loop (f-tail adjlist))))))
  (loop adjlist))

(define (reverse-children x)
  (define (loop x buf)
    (if-null? x buf
              (loop (f-tail x)
                    (f-append (f-head x) buf))))

  (loop x (f-new)))

(define (c-member? collection-node item-node)
  (define (loop collection-node)
    (if-null?
     collection-node false-node
     (progn
      (defvar first (f-car collection-node))
      (if-eq?
       first item-node
       true-node
       (loop (f-tail collection-node))))))
  (loop collection-node))

(define (graph->adjlist g)
  (defvar return (f-new))
  (defvar visited-list (f-new))

  (define (add-to-return node)
    (set! return (f-cons node return)))

  (define (loop g)
    (defvar consed (f-cons g g))
    (if-true?
     (c-member? visited-list g)
     (add-to-return consed)
     (progn
       (set! visited-list (f-cons g visited-list))
       (add-to-return consed)
       (for-each loop (node-children g)))))

  (loop g)

  (reverse-children return))

(define (serialize-graph g)
  (defvar adjlist (graph->adjlist g))

  (pretty-print-graph adjlist) (newline)

  (defvar conc
    (intersperse-adjlist-with-separators adjlist))

  (pretty-print-graph conc) (newline)

  (defvar flat
    (flatten-children conc))

  (pretty-print-graph flat) (newline)

  (defvar bin
    (to-binary flat))

  (pretty-print-graph bin) (newline)

  bin)

;; (define (deserialize-graph bin)
;;   (defvar conc
;;     (split-by-separator bin))

;;   bin)

;; (debugv (graph->list input))

(define (main)
  (pretty-print-graph input) (newline)

  (defvar serialized
    (serialize-graph input))

  ;; (defvar unserialized
  ;;   (deserialize-graph serialized))

  (values))

(main)
