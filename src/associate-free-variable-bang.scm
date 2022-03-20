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

%var associate-free-variable!

%use (raisu) "./euphrates/raisu.scm"
%use (stack-push!) "./euphrates/stack.scm"
%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (node-equal?) "./node-equal-huh.scm"

;; returns #t on success, #f on failure
(define (associate-free-variable! free-stack free-node target-node)
  (define meta (node-meta free-node))

  (unless (free-variable? free-node)
    (raisu 'trying-to-associate-variable-that-is-not-free free-node))

  (if (free-variable-associated? free-node)
      (let ((current-target (free-variable-get-association free-node)))
        (node-equal? current-target target-node))
      (begin
        (set-node-meta! free-node (cons 'free-var target-node))
        (stack-push! free-stack free-node)
        #t)))

