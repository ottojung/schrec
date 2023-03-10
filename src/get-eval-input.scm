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

%var get-eval-input

%use (list-ref-or) "./euphrates/list-ref-or.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"

(define (get-eval-input graph)
  (define children (node-children graph))
  (or (list-ref-or children 1 #f)
      (raisu 'eval-does-not-have-a-body graph)))
