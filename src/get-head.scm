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

%var get-head

%use (node-children node-label node-namespace) "./node.scm"
%use (branch-node-label) "./branch-node-label.scm"

(define (get-head n node)
  (let loop ((n n) (node node))
    (if (<= n 0) '?
        (let* ((label (node-label node))
               (rec (map (lambda (node) (loop (- n 1) node))
                         (node-children node))))
          (if (equal? label branch-node-label)
              rec
              (if (null? rec)
                  label
                  (list label rec)))))))

