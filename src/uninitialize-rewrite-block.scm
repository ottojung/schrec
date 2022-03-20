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

%var uninitialize-rewrite-block

%use (node-children set-node-children! node-label set-node-meta!) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (stack->list) "./euphrates/stack.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (soft-uninitialize-capture-variable!) "./soft-uninitialize-capture-variable-bang.scm"
%use (free-variable?) "./free-variable-huh.scm"

(define (uninitialize-rewrite-block free-stack block main-input)
  (define children (node-children block))
  (define capture-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (for-each (lambda (var) (soft-uninitialize-capture-variable! var)) capture-list)
  (for-each (lambda (var) (uninitialize-free-variable! var)) (stack->list free-stack))
  (set-node-meta! block #f)

  #t)
