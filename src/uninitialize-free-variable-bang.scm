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

%var uninitialize-free-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (uninitialize-free-variable! free-node)
  (unless (free-variable? free-node)
    (raisu 'trying-to-deinitialize-variable-that-is-not-free free-node))

  (set-node-meta! free-node #f))
