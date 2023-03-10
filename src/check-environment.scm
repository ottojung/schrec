;;;; Copyright (C) 2021, 2022  Otto Jung
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

%var check-environment

%use (list-and-map) "./euphrates/list-and-map.scm"
%use (list-length=) "./euphrates/list-length-eq.scm"
%use (check-rewrite-block) "./check-rewrite-block.scm"
%use (get-environment-blocks) "./get-environment-blocks.scm"
%use (node-children) "./node.scm"

;; returns #t or success
(define (check-environment env)
  (define children (node-children env))
  (and (list-length= 3 children)
       (let ((blocks (get-environment-blocks env)))
         (list-and-map check-rewrite-block blocks))))


