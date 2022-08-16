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
%use (variable-associated?/nondet) "./variable-associated-huh-nondet.scm"
%use (associate-variable!/nondet) "./associate-variable-bang-nondet.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (thread-fork) "./thread-fork.scm"

%use (debug) "./euphrates/debug.scm"
%use (debugv) "./euphrates/debugv.scm"
%use (get-head) "./get-head.scm"

(define (node-lists-equal?/no-deref a b)
  (and
   (= (length a) (length b))
   (list-and-map node-equal? a b)))

(define (node-matches? pattern-node input-node-list)
  (define (deref x)
    (or (variable-get-association-or/nondet x #f)
        (list x)))

  (node-lists-equal?/no-deref
   (deref pattern-node)
   input-node-list))

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

(define (debug-log-bind current taken result)
  (let* ((cur1 (get-head 4 current))
         ;; (taken1 (list->vector (map (lambda (x) (get-head 4 x)) taken)))
         (taken1
          (let ((ass (variable-get-association-or/nondet current #f)))
            (list->vector (map (lambda (n) (get-head 4 n)) ass)))))
    (debug "Bind ~s to ~s -> ~s    [~s]" cur1 taken1 result (get-current-thread))))

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

     (define (continue)
       (main-loop* free-stack rest left))

     (if (variable-associated?/nondet current)
         (if (node-matches? current taken)
             (continue)
             '())
         (thread-fork
          ;; (let ((th (get-current-thread)))
          ;;   (debugv th))
          ;; (let* ((get0 (variable-get-association-or/nondet current #f))
          ;;        (get (and get0 (map (lambda (g) (get-head 4 g)) get0))))
          ;;   (debugv get))

          ;; (let ((cur1 (get-head 4 current)))
          ;;   (debugv cur1))
          ;; (let ((taken1 (list->vector (map (lambda (x) (get-head 4 x)) taken))))
          ;;   (debugv taken1))
          ;; (let ((left1 (list->vector (map (lambda (x) (get-head 4 x)) left))))
          ;;   (debugv left1))

          (associate-variable!/nondet free-stack current taken)
          (let ((threads (continue)))
            ;; (debug-log-bind current taken (if (null? threads) 'FAIL 'OK))
            (if (null? current-children) threads
                (list-map/flatten
                 (recur-on-children free-stack current-children taken)
                 threads))))))
   (range (+ 1 (length input-nodes)))))

(define (main-loop* free-stack match-nodes input-nodes)
  (define match-heads
    (map (lambda (n) (get-head 5 n)) match-nodes))
  (define input-heads
    (map (lambda (n) (get-head 5 n)) input-nodes))

  ;; (debugv (get-current-thread))
  ;; (debugv match-heads)
  ;; (debugv input-heads)

  (define ret
    (if (null? match-nodes)
        (if (null? input-nodes)
            (list (get-current-thread))
            '())
        (match-current free-stack match-nodes input-nodes)))

  ;; (debugv (length match-nodes))
  ;; (debugv (length input-nodes))
  ;; (debugv ret)

  ret)

(define (main-loop free-stack match-val input-val)
  (define match-nodes (node-children match-val))
  (define input-nodes (node-children input-val))

  (main-loop* free-stack match-nodes input-nodes))

(define match-root #f)

(define (run-match-pattern/nondet free-stack match-node input-val)
  (define match-val
    (variable-get-association-or/nondet match-node (list match-node)))

  (set! match-root match-node)

  (main-loop* free-stack match-val (list input-val)))
