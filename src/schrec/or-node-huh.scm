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
  (define-module (or-node-huh)
    :export (or-node?)
    :use-module ((keyword-or) :select (keyword-or))
    :use-module ((node) :select (node-label))
    :use-module ((root-namespace-node-huh) :select (root-namespace-node?))
    )))



(define (or-node? node)
  (and (root-namespace-node? node)
       (equal? keyword-or (node-label node))))
