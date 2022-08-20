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

%var associate-variable!

%use (raisu) "./euphrates/raisu.scm"
%use (stack-push!) "./euphrates/stack.scm"

%use (set-node-binding!) "./node.scm"
%use (variable-associated?/det) "./variable-associated-huh-det.scm"
%use (const-variable?) "./const-variable-huh.scm"

(define (associate-variable! free-stack node target-node)
  (if (variable-associated?/det node)
      (if (const-variable? node)
          (raisu 'trying-to-associate-a-constant node target-node)
          (raisu 'already-associated node target-node))
      (begin
        (stack-push! free-stack node)
        (set-node-binding! node target-node))))
