;;;; Copyright (C) 2022  Otto Jung
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

%run guile

%var rewrite-rewrite-block/nondet

%use (raisu) "./euphrates/raisu.scm"
%use (get-block-input) "./get-block-input.scm"
%use (get-block-rpattern) "./get-block-rpattern.scm"
%use (run-rewrite-pattern-nondet) "./run-rewrite-pattern-nondet.scm"
%use (variable-get-association-nondet-singleton) "./variable-get-association-nondet-singleton.scm"

(define (rewrite-rewrite-block/nondet free-stack block)
  (define input-node (get-block-input block))
  (define replace-pattern (get-block-rpattern block))

  (define input-val
    (or (variable-get-association-nondet-singleton input-node input-node #f)
        (raisu 'bad-input-node-in-rewrite-rewrite-block-nondet input-node)))

  (run-rewrite-pattern-nondet replace-pattern input-val))
