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

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-constant? set-node-constant?! node-binding set-node-binding! node-visited? set-node-visited?!) "./node.scm"
%use (run-rewrite-pattern/nondet) "./run-rewrite-pattern-nondet.scm"
%use (variable-get-association-or/nondet) "./variable-get-association-or-nondet.scm"
%use (variable-get-association-nondet-singleton) "./variable-get-association-nondet-singleton.scm"

(define (rewrite-rewrite-block/nondet free-stack block main-input)
  (define children (node-children block))
  (define const-node (list-ref children 0))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define const-list (node-children const-node))

  (define input-val
    (or (variable-get-association-nondet-singleton input-node main-input #f)
        (raisu 'bad-input-node-in-rewrite-rewrite-block-nondet input-node)))

  (run-rewrite-pattern/nondet replace-pattern input-val))
