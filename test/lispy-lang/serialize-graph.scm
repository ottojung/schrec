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

;; g is like:
;; (let ((a (m m))
;;       (m ()))
;;   (eva1 g (((m a b) g (m x) (b m)))
;;         (let ((a ()))
;;           (m a))))

;; (define example
;;   '(let ((a (m m))
;;          (m ()))
;;      (eva1 g (((m a b) g (m x) (b m)))
;;            (let ((a ()))
;;              (m a)))))

(define example
  '(a (b c d eval) (e c f)))

(define input
  (list->graph example))

;;;;;;;;;;;;;;
;; Builtins ;;
;;;;;;;;;;;;;;

(define (op-cons target left right)
  (set-node-children!
   target
   (cons left (node-children right))))

;; NOTE: no equivalent op- version
(define (f-car x)
  (when (null? (node-children x))
    (raisu 'null-head-children x))

  (car (node-children x)))

(define (op-append target left right)
  (unless (list-singleton? (node-children left))
    (raisu 'not-singleton! left))

  (set-node-children!
   target
   (cons (car (node-children left))
         (node-children right))))

(define (op-head target x)
  (when (null? (node-children x))
    (raisu 'null-head-children x))

  (set-node-children!
   target (list (car (node-children x)))))

(define (op-tail target x)
  (when (null? (node-children x))
    (raisu 'null-tail-children x))

  (set-node-children! target (cdr (node-children x))))

(define (op-define)
  (make-fresh-branch-node '()))

(define (op-null? x)
  (null? (node-children x)))

(define (op-eq? a b)
  (node-equal? a b))

;; NOTE: compiled into equivalent `(if (eq? eval-node x) then else))` code.
(define (eval-node? x)
  (eval-multi-node? x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functional equivalents ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (f-cons a b)
  (define return (op-define))
  (op-cons return a b)
  return)

(define (f-append a b)
  (define return (op-define))
  (op-append return a b)
  return)

(define (f-head x)
  (define return (op-define))
  (op-head return x)
  return)

(define (f-tail x)
  (define return (op-define))
  (op-tail return x)
  return)

;;;;;;;;;;;;;
;; Helpers ;;
;;;;;;;;;;;;;

(define separator (make-fresh-atom-node '/ 0))
(define digit0 (make-fresh-atom-node 'o 0))
(define digit1 (make-fresh-atom-node 'i 0))

(define (make-singleton x)
  (define return (op-define))
  (op-cons return x return)
  return)

(define (concat left right)
  (let loop ((left left))
    (if (op-null? left) right
        (f-append (f-head left) (loop (f-tail left))))))

(define (copy-children x)
  (f-append (f-head x) (f-tail x)))

(define (to-binary x)
  (let loop ((x x))
    (if (op-null? x) (op-define)
        (let* ((first (f-car x)))
          (define m
            (cond
             ((op-eq? first separator) separator)
             ((eval-node? first) digit1)
             (else digit0)))
          (define mlist
            (make-singleton m))
          (f-append mlist (loop (f-tail x)))))))

(define (flatten-children x)
  (let loop ((x x))
    (if (op-null? x) (op-define)
        (concat
         (f-car x)
         (loop (f-tail x))))))

(define (intersperse-adjlist-with-separators adjlist)
  (define sep-list (make-singleton separator))

  (let loop ((adjlist adjlist))
    (if (op-null? adjlist)
        (op-define)
        (concat
         (f-head adjlist)
         (f-cons sep-list (loop (f-tail adjlist)))))))

(define (reverse-children x)
  (let loop ((x x) (buf (op-define)))
    (if (op-null? x) buf
        (loop (f-tail x)
              (f-append (f-head x) buf)))))

(define (graph->adjlist g)
  (define return (op-define))

  (define (add-to-return node)
    (op-cons return node return))

  (define (loop g)
    (define consed (f-cons g g))
    (add-to-return consed)
    (for-each loop (node-children g)))

  (loop g)

  (reverse-children return))

(define (serialize-graph g)
  (define adjlist (graph->adjlist g))

  (pretty-print-graph adjlist) (newline)

  (define conc
    (intersperse-adjlist-with-separators adjlist))

  (pretty-print-graph conc) (newline)

  (define flat
    (flatten-children conc))

  (pretty-print-graph flat) (newline)

  (define bin
    (to-binary flat))

  (pretty-print-graph bin) (newline)

  bin)

(define (deserialize-graph bin)
  bin)

;; (debugv (graph->list input))

(define return
  (serialize-graph input))
