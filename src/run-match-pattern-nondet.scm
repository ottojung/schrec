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

%var run-match-pattern/nondet

%use (list-and-map) "./euphrates/list-and-map.scm"
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"
%use (list-take-n) "./euphrates/list-take-n.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (range) "./euphrates/range.scm"

%use (node-children) "./node.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (thread-relative) "./thread-relative.scm"
%use (variable-get-association-or/nondet) "./variable-get-association-or-nondet.scm"
%use (variable-get-association-nondet-singleton) "./variable-get-association-nondet-singleton.scm"
%use (associate-variable!/nondet) "./associate-variable-bang-nondet.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (engine-fork) "./engine-fork.scm"

%use (debug) "./euphrates/debug.scm"
%use (debugv) "./euphrates/debugv.scm"
%use (get-head) "./get-head.scm"

(define (node-lists-equal? a b)
  (and
   (= (length a) (length b))
   (list-and-map node-equal? a b)))

(define (recur-on-children free-stack current-children taken)
  (lambda (thread)
    (let loop ((taken taken)
               (threads (list thread)))
      (if (null? taken) threads
          (let* ((taken-node (car taken))
                 (other-children (node-children taken-node))
                 (new-threads
                  (list-map/flatten
                   (thread-relative
                    (main-loop* free-stack current-children other-children))
                   threads)))
            (loop (cdr taken) new-threads))))))

(define (match-current free-stack match-nodes input-nodes)
  (define current (car match-nodes))
  (define rest (cdr match-nodes))
  (define current-children (node-children current))

  ;; (let ((current-head (get-head 4 current)))
  ;;   (debugv current-head))

  (list-map/flatten
   (lambda (i)
     (define taken (list-take-n i input-nodes))
     (define left  (list-drop-n i input-nodes))

     (engine-fork
      ;; (let ((th (get-current-thread)))
      ;;   (debugv th))
      ;; (let* ((get0 (variable-get-association-or/nondet current #f))
      ;;        (get (and get0 (map (lambda (g) (get-head 4 g)) get0))))
      ;;   (debugv get))

      (associate-variable!/nondet free-stack current taken)

      (let ((threads (main-loop* free-stack rest left)))
        (list-map/flatten
         (recur-on-children free-stack current-children taken)
         threads))))
   (range (+ 1 (length input-nodes)))))

(define (main-loop* free-stack match-nodes input-nodes)
  (define match-heads
    (map (lambda (n) (get-head 5 n)) match-nodes))
  (define input-heads
    (map (lambda (n) (get-head 5 n)) input-nodes))

  ;; (debugv match-heads)
  ;; (debugv input-heads)
  ;; (debugv (length match-nodes))
  ;; (debugv (length input-nodes))

  (if (null? match-nodes)
      (if (null? input-nodes)
          (list (get-current-thread))
          '())
      (match-current free-stack match-nodes input-nodes)))

(define (main-loop free-stack match-val input-val)
  (define match-nodes (node-children match-val))
  (define input-nodes (node-children input-val))

  (main-loop* free-stack match-nodes input-nodes))

(define (run-match-pattern/nondet free-stack match-node input-val)
  (define match-val
    (variable-get-association-or/nondet match-node (list match-node)))

  (main-loop* free-stack match-val (list input-val)))
