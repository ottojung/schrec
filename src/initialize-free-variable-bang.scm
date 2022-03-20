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

%var initialize-free-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"

;; returns #t on success, #f on failure
(define (initialize-free-variable! free-node)
  (define meta (node-meta free-node))

  (if meta (raisu 'unexpected-initialized-free-variable! free-node)
      (begin
        (set-node-meta! free-node (cons 'free-var #f))
        #t)))
