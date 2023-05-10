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

(cond-expand
 (guile
  (define-module (eval-single-node-huh)
    :export (eval-single-node?)
    :use-module ((keyword-eval-single) :select (keyword-eval-single))
    :use-module ((node) :select (node-label))
    :use-module ((root-namespace-node-huh) :select (root-namespace-node?))
    )))



(define (eval-single-node? n)
  (and (equal? keyword-eval-single (node-label n))
       (root-namespace-node? n)))
