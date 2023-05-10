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
  (define-module (uninitialize-rewrite-block)
    :export (uninitialize-rewrite-block)
    :use-module ((node) :select (node-children))
    :use-module ((soft-uninitialize-const-variable-bang) :select (soft-uninitialize-const-variable!))
    )))



(define (uninitialize-rewrite-block free-stack block)
  (define children (node-children block))
  (define const-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (for-each soft-uninitialize-const-variable! const-list)

  #t)
