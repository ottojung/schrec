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

%var make-nodeinfo
%var nodeinfo?
%var nodeinfo-label
%var nodeinfo-namespace
%var nodeinfo-display
%var set-nodeinfo-display!

%use (define-type9) "./euphrates/define-type9.scm"

(define-type9 nodeinfo
  (nodeinfo-ctor label namespace display) nodeinfo?
  (label nodeinfo-label)
  (namespace nodeinfo-namespace)
  (display nodeinfo-display set-nodeinfo-display!) ;; label by which this is displayed
  )

(define (make-nodeinfo label namespace)
  (nodeinfo-ctor label namespace #f))
