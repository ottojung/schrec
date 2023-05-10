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
  (define-module (schrec rewrite-rewrite-block-nondet)
    :export (rewrite-rewrite-block/nondet)
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec get-block-input) :select (get-block-input))
    :use-module ((schrec get-block-rpattern) :select (get-block-rpattern))
    :use-module ((schrec run-rewrite-pattern-nondet) :select (run-rewrite-pattern-nondet))
    :use-module ((schrec variable-get-association-nondet-singleton) :select (variable-get-association-nondet-singleton))
    )))



(define (rewrite-rewrite-block/nondet free-stack block)
  (define input-node (get-block-input block))
  (define replace-pattern (get-block-rpattern block))

  (define input-val
    (or (variable-get-association-nondet-singleton input-node input-node #f)
        (raisu 'bad-input-node-in-rewrite-rewrite-block-nondet input-node)))

  (run-rewrite-pattern-nondet replace-pattern input-val))
