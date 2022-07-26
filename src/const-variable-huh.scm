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

%var const-variable?

%use (make-node node? node-children set-node-children! node-id node-label node-namespace node-type node-bindtype set-node-bindtype! node-binding set-node-binding! node-status set-node-status! node-visited? set-node-visited?!) "./node.scm"

(define (const-variable? node)
  (equal? 'const-var (node-bindtype node)))