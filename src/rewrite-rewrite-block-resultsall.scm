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

%var rewrite-rewrite-block/resultsall

%use (raisu) "./euphrates/raisu.scm"

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-constant? set-node-constant?! node-binding set-node-binding! node-visited? set-node-visited?!) "./node.scm"
%use (run-rewrite-pattern-resultsall) "./run-rewrite-pattern-resultsall.scm"
%use (variable-get-association-or/resultsall) "./variable-get-association-or-resultsall.scm"
%use (variable-get-association-resultsall-singleton) "./variable-get-association-resultsall-singleton.scm"

(define (rewrite-rewrite-block/resultsall free-stack block)
  (define children (node-children block))
  (define const-node (list-ref children 0))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define const-list (node-children const-node))

  (define input-val
    (or (variable-get-association-resultsall-singleton input-node input-node #f)
        (raisu 'bad-input-node-in-rewrite-rewrite-block-resultsall input-node)))

  (run-rewrite-pattern-resultsall replace-pattern input-val))
