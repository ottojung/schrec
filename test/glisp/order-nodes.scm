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

%var order-nodes

%use (eval-node f-cons f-null if-eq? if-null? progn set) "./builtins.scm"
%use (foreach-child in-children? reverse-children) "./helpers.scm"

;; Always puts eval node first even if it is not present in the `graph'.
(define order-nodes
  (lambda (graph)
    (define visited-list (f-null))

    (define add-to-visited
      (lambda (node)
        (set visited-list (f-cons node visited-list))))

    (define loop
      (lambda (g)
        (define consed (f-cons g g))
        (if-null?
         (in-children? visited-list g)
         (f-null)
         (if-eq? eval-node g
                 (progn
                  (foreach-child loop g))
                 (progn
                  (add-to-visited g)
                  (foreach-child loop g))))))

    (loop graph)

    (f-cons
     eval-node
     (reverse-children visited-list))))
