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
  (define-module (schrec run-match-pattern-nondet)
    :export (run-match-pattern-nondet)
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((euphrates list-drop-n) :select (list-drop-n))
    :use-module ((euphrates list-map-flatten) :select (list-map/flatten))
    :use-module ((euphrates list-take-n) :select (list-take-n))
    :use-module ((euphrates range) :select (range))
    :use-module ((schrec associate-variable-bang-nondet) :select (associate-variable!/det/nondet))
    :use-module ((schrec get-current-match-thread) :select (get-current-match-thread))
    :use-module ((schrec match-thread-fork) :select (match-thread-fork))
    :use-module ((schrec match-thread-relative) :select (match-thread-relative))
    :use-module ((schrec node-equal-huh) :select (node-equal?))
    :use-module ((schrec node) :select (node-children))
    :use-module ((schrec variable-associated-huh-nondet) :select (variable-associated?/nondet))
    :use-module ((schrec variable-get-association-or-nondet) :select (variable-get-association-or-nondet))
    )))



(define (node-lists-equal?/no-deref a b)
  (and
   (= (length a) (length b))
   (list-and-map node-equal? a b)))

(define (node-matches? pattern-node input-node-list)
  (node-lists-equal?/no-deref
   (or (variable-get-association-or-nondet pattern-node #f)
       (list pattern-node))
   input-node-list))

(define (recur-on-children free-stack current-children taken)
  (lambda (match-thread)
    (let loop ((taken taken)
               (match-threads (list match-thread)))
      (if (null? taken) match-threads
          (let* ((taken-node (car taken))
                 (other-children (node-children taken-node))
                 (new-match-threads
                  (list-map/flatten
                   (match-thread-relative
                    (main-loop* free-stack current-children other-children))
                   match-threads)))
            (loop (cdr taken) new-match-threads))))))

(define (match-current free-stack match-nodes input-nodes)
  (define current (car match-nodes))
  (define rest (cdr match-nodes))
  (define current-children (node-children current))

  (list-map/flatten
   (lambda (i)
     ;; TODO(speed): improve below by removing the `car' from `left' on each iteration and adding it to `taken'
     (define taken (list-take-n i input-nodes))
     (define left  (list-drop-n i input-nodes))

     (define (continue)
       (main-loop* free-stack rest left))

     (if (variable-associated?/nondet current)
         (if (node-matches? current taken)
             (continue)
             '())
         (match-thread-fork
          (associate-variable!/det/nondet free-stack current taken)
          (let ((match-threads (continue)))
            (if (null? current-children) match-threads
                (list-map/flatten
                 (recur-on-children free-stack current-children taken)
                 match-threads))))))
   (range (+ 1 (length input-nodes)))))

(define (main-loop* free-stack match-nodes input-nodes)
  (if (null? match-nodes)
      (if (null? input-nodes)
          (list (get-current-match-thread))
          '())
      (match-current free-stack match-nodes input-nodes)))

(define (run-match-pattern-nondet free-stack match-node input-val)
  (match-current free-stack (list match-node) (list input-val)))
