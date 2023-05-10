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
  (define-module (default-eval-hook)
    :export (default-eval-hook)
    :use-module ((pretty-print-graph) :select (pretty-print-graph))
    )))



(cond-expand
 (guile
  (use-modules (ice-9 pretty-print))
  ))

(define (default-eval-hook original-graph)
  (lambda (env body ptr)
    (display "\n\nStep:\n")
    (when env
      (pretty-print-graph env)
      (display "--------\n"))
    (pretty-print-graph body)))


