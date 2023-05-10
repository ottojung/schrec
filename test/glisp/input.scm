;;;; Copyright (C) 2022, 2023 Otto Jung
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
  (define-module (glisp input)
    :export (input)
    :use-module ((schrec list-to-graph) :select (list->graph))
    )))



(define example
  '(let ((a (m m))
         (m (a)))
     a))

;; (eval g (((m a b) g (m x) (b m)))
;;       (let ((a ()))
;;         (m a)))))

;; (define example
;;   '(a (b c eval d) e))

(define input
  (list->graph example))
