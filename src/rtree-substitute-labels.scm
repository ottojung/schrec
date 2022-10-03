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

%var rtree-substitute-labels

%use (node-display node-label) "./node.scm"
%use (rtree-dereference) "./rtree-dereference.scm"

(define (rtree-substitute-labels T)
  (define (get-label node)
    (or (node-display node)
        (node-label node)))

  (let loop ((x (rtree-dereference T)))
    (if (list? x)
        (map loop x)
        (get-label x))))
