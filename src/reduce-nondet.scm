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

%var reduce/nondet

%use (list-or-map) "./euphrates/list-or-map.scm"

%use (find-partially-sorted-evals) "./find-partially-sorted-evals.scm"
%use (eval/nondet) "./eval-nondet.scm"
%use (make-thread-id) "./make-thread-id.scm"
%use (current-thread/p) "./current-thread-p.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (node-children) "./node.scm"

;; Returns list of thread its that were the finishers
(define (reduce/nondet graph)
  (define result '())

  (define (eval-fun)
    ;; These evals are grouped such that
    ;; in each group every element can be run first
    (define evals (find-partially-sorted-evals graph))

    (let loop ((evals evals))
      (if (null? evals)
          (begin
            (set! result (cons (get-current-thread) result))
            '())
          (let* ((group (car evals))
                 (successful-thread-ids
                  (apply
                   append
                   (map
                    (lambda (eval-form)
                      (define children (node-children eval-form))
                      (define env (list-ref children 1))
                      (define body (list-ref children 2))
                      (eval/nondet env body))
                    group))))
            (if (null? successful-thread-ids)
                (loop (cdr evals))
                successful-thread-ids)))))

  (let oloop ((threads (eval-fun)))
    (unless (null? threads)
      (oloop
       (apply
        append
        (map
         (lambda (thread)
           (parameterize ((current-thread/p thread))
             (eval-fun)))
         threads)))))

  result)
