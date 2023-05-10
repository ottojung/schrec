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
  (define-module (match-rewrite-block-det)
    :export (match-rewrite-block/det)
    :use-module ((get-block-input) :select (get-block-input))
    :use-module ((get-block-mpattern) :select (get-block-mpattern))
    :use-module ((run-match-pattern-det) :select (run-match-pattern-det))
    :use-module ((variable-get-association-or-det) :select (variable-get-association-or-det))
    )))



(define (match-rewrite-block/det free-stack block)
  (define input-node (get-block-input block))
  (define match-pattern (get-block-mpattern block))

  (define input-val
    (variable-get-association-or-det input-node input-node))

  (run-match-pattern-det free-stack match-pattern input-val))
