;;;; Copyright (C) 2022, 2023 Otto Jung
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

(cond-expand
 (guile
  (define-module (schrec nodeinfo)
    :export (make-nodeinfo nodeinfo? nodeinfo-label nodeinfo-namespace nodeinfo-display set-nodeinfo-display!)
    :use-module ((euphrates define-type9) :select (define-type9))
    )))



(define-type9 nodeinfo
  (nodeinfo-ctor label namespace display) nodeinfo?
  (label nodeinfo-label)
  (namespace nodeinfo-namespace)
  (display nodeinfo-display set-nodeinfo-display!) ;; label by which this is displayed
  )

(define (make-nodeinfo label namespace)
  (nodeinfo-ctor label namespace #f))
