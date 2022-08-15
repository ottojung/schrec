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

%var uninitialize-variable!

%use (raisu) "./euphrates/raisu.scm"

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-constant? set-node-constant?! node-binding set-node-binding! node-status set-node-status! node-visited? set-node-visited?!) "./node.scm"
%use (variable-associated?) "./variable-associated-huh.scm"

(define (uninitialize-variable! node)
  ;; (unless (variable-associated? node)
  (unless (node-binding node)
    (raisu 'variable-not-associated node))

  (set-node-binding! node #f)
  (set-node-constant?! node #f)
  )
