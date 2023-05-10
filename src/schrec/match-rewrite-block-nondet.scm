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
  (define-module (schrec match-rewrite-block-nondet)
    :export (match-rewrite-block/nondet)
    :use-module ((get-block-input) :select (get-block-input))
    :use-module ((get-block-mpattern) :select (get-block-mpattern))
    :use-module ((run-match-pattern-nondet) :select (run-match-pattern-nondet))
    :use-module ((variable-get-association-nondet-singleton) :select (variable-get-association-nondet-singleton))
    )))



(define (match-rewrite-block/nondet free-stack block)
  (define input-node (get-block-input block))
  (define match-pattern (get-block-mpattern block))

  (define input-val
    (variable-get-association-nondet-singleton input-node input-node #f))

  (define ret
    (if (not input-val) '()
        (run-match-pattern-nondet free-stack match-pattern input-val)))

  ret)
