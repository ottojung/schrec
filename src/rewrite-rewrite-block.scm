;;;; Copyright (C) 2021, 2022  Otto Jung
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

%var rewrite-rewrite-block

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-constant? set-node-constant?! node-binding set-node-binding! node-visited? set-node-visited?!) "./node.scm"
%use (run-rewrite-pattern) "./run-rewrite-pattern.scm"
%use (variable-get-association-or) "./variable-get-association-or.scm"

(define (rewrite-rewrite-block free-stack block main-input)
  (define children (node-children block))
  (define const-node (list-ref children 0))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define const-list (node-children const-node))

  (define input-val
    (variable-get-association-or input-node main-input))

  (run-rewrite-pattern replace-pattern input-val))
