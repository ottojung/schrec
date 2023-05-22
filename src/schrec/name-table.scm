;;;; Copyright (C) 2023 Otto Jung
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
  (define-module (schrec name-table)
    :export (name-table-add! name-table-ref)
    :use-module ((euphrates hashmap) :select (hashmap-ref hashmap-set!))
    :use-module ((schrec name-table-p) :select (name-table/p))
    :use-module ((schrec node) :select (node-label node-namespace))
    )))


(define (name-table-add! node)
  (define name-table (name-table/p))
  (define key (cons
               (node-label node)
               (node-namespace node)))
  (hashmap-set! name-table key node))

(define (name-table-ref atom namespace)
  (define name-table (name-table/p))
  (define key (cons atom namespace))
  (hashmap-ref name-table key #f))
