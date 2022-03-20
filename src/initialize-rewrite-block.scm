;;;; Copyright (C) 2021  Otto Jung
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

%var initialize-rewrite-block

%use (node-children set-node-children! node-label set-node-meta!) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (soft-initialize-capture-variable!) "./soft-initialize-capture-variable-bang.scm"

(define (initialize-rewrite-block free-stack block main-input)
  (define children (node-children block))
  (define capture-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define left-overs (list-drop-n 4 children))

  (unless (null? left-overs)
    (raisu 'too-many-nodes-on-rewrite-block-top-level block))

  (for-each (lambda (var) (soft-initialize-capture-variable! var)) capture-list)
  (set-node-meta! block 'initialized)

  #t)
