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

%var check-and-expression-syntax

%use (list-length=<?) "./euphrates/list-length-geq-q.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"
%use (and-node?) "./and-node-huh.scm"

(define (check-and-expression-syntax node)
  (define children (node-children node))
  (unless (and (list-length=<? 3 children)
               (and-node? (car children)))
    (raisu 'and-has-bad-syntax node)))
