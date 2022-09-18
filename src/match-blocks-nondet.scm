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

%var match-blocks/nondet

%use (list-map/flatten) "./euphrates/list-map-flatten.scm"
%use (associate-variable!/det/nondet) "./associate-variable-bang-nondet.scm"
%use (get-current-match-thread) "./get-current-match-thread.scm"
%use (match-rewrite-block/nondet) "./match-rewrite-block-nondet.scm"
%use (match-thread-relative) "./match-thread-relative.scm"

;; returns a list of `match-thread's
(define (match-blocks/nondet free-stack constants main-input pointer-node blocks)
  (associate-variable!/det/nondet free-stack main-input (list pointer-node))

  (for-each
   (lambda (const)
     (associate-variable!/det/nondet free-stack const (list const)))
   constants)

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
          (loop new-match-threads (cdr blocks))))))
