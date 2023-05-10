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
  (define-module (get-eval-body)
    :export (get-eval-body)
    :use-module ((euphrates list-ref-or) :select (list-ref-or))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((node) :select (node-children))
    )))



(define (get-eval-body graph)
  (define children (node-children graph))
  (or (list-ref-or children 2 #f)
      (raisu 'eval-does-not-have-a-body graph)))
