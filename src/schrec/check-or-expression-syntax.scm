;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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
  (define-module (schrec check-or-expression-syntax)
    :export (check-or-expression-syntax)
    :use-module ((euphrates list-length-geq-q) :select (list-length=<?))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec node) :select (node-children))
    :use-module ((schrec or-node-huh) :select (or-node?))
    )))



(define (check-or-expression-syntax node)
  (define children (node-children node))
  (unless (and (list-length=<? 3 children)
               (or-node? (car children)))
    (raisu 'or-has-bad-syntax node)))
