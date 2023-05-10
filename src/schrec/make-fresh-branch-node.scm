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
  (define-module (make-fresh-branch-node)
    :export (make-fresh-branch-node)
    :use-module ((branch-node-label) :select (branch-node-label))
    :use-module ((make-fresh-node) :select (make-fresh-node))
    :use-module ((root-namespace) :select (root-namespace))
    )))



(define (make-fresh-branch-node children)
  (make-fresh-node branch-node-label root-namespace children))
