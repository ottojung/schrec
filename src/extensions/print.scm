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
  (define-module (extensions print)
    :use-module ((schrec pretty-print-graph) :select (pretty-print-graph))
    )))

(define (print-handler g)
  (pretty-print-graph g)
  #f)

(define (print-handler/multi g)
  (pretty-print-graph g)
  (list))

(define (print-check-fn self g)
  #t)

(lambda (input)
  `((manifestversion . 1)
    (name . print)
    (check-fn . ,print-check-fn)
    (run/det-fn . ,print-handler)
    (run/nondet-fn . ,print-handler/multi)
    (run/random-fn . ,print-handler)))
