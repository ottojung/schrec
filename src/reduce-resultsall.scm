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

%var reduce/resultsall

%use (cons!) "./euphrates/cons-bang.scm"
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"
%use (list-or-map) "./euphrates/list-or-map.scm"
%use (stack-empty? stack-make stack-pop! stack-push!) "./euphrates/stack.scm"
%use (eval/resultsall/node) "./eval-resultsall-node.scm"
%use (find-partially-sorted-evals) "./find-partially-sorted-evals.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (make-thread-id) "./make-thread-id.scm"
%use (node-children) "./node.scm"
%use (thread-relative) "./thread-relative.scm"

;; Returns an enumerator of thread IDs that were the finishers
(define (reduce/resultsall graph)
  (define mem (list (get-current-thread)))
  (define results (stack-make))
  (define ever-reduced-anything? #f)

  (define (eval-fun)
    ;; These `evals' are grouped such that
    ;;   in each group every element can be run first
    (define evals (find-partially-sorted-evals graph))

    (let loop ((evals evals))
      (if (null? evals)
          (begin
            (stack-push! results (get-current-thread))
            '())
          (let* ((group (car evals))
                 (successful-thread-ids
                  (list-map/flatten eval/resultsall/node group)))
            (if (null? successful-thread-ids)
                (loop (cdr evals))
                (begin
                  (unless ever-reduced-anything?
                    (set! ever-reduced-anything? #t))
                  successful-thread-ids))))))

  (lambda _
    (when (stack-empty? results)
      (let oloop ((threads mem))
        (if (or (not (stack-empty? results))
                (null? threads))
            (set! mem threads)
            (oloop
             (list-map/flatten
              (thread-relative (eval-fun)) threads)))))

    (cond
     ((not ever-reduced-anything?) #f)
     ((stack-empty? results) #f)
     (else (stack-pop! results)))))
