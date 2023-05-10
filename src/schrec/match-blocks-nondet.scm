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
  (define-module (schrec match-blocks-nondet)
    :export (match-blocks/nondet)
    :use-module ((euphrates list-map-flatten) :select (list-map/flatten))
    :use-module ((schrec get-current-match-thread) :select (get-current-match-thread))
    :use-module ((schrec initialize-const-variables-nondet) :select (initialize-const-variables/nondet))
    :use-module ((schrec match-rewrite-block-nondet) :select (match-rewrite-block/nondet))
    :use-module ((schrec match-thread-relative) :select (match-thread-relative))
    )))



;; returns a list of `match-thread's
(define (match-blocks/nondet free-stack constants main-input pointer-node blocks)
  (if (not (initialize-const-variables/nondet free-stack constants main-input pointer-node))
      '()
      (let loop ((match-threads (list (get-current-match-thread)))
                 (blocks blocks))
        (if (or (null? blocks)
                (null? match-threads))
            match-threads
            (let ((cur (car blocks)))
              (define new-match-threads
                (list-map/flatten
                 (match-thread-relative
                  (match-rewrite-block/nondet free-stack cur))
                 match-threads))
              (loop new-match-threads (cdr blocks)))))))
