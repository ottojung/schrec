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

%var make-node
%var node?
%var node-children
%var set-node-children!
%var node-id
%var node-label
%var node-type
%var node-meta
%var set-node-meta!
%var node-visited?
%var set-node-visited?!

%use (define-type9) "./euphrates/define-type9.scm"

(define-type9 <n>
  (node-ctor id children label type meta visited?) node?
  ;; reference part
  (id node-id)

  ;; children part
  (children node-children set-node-children!)

  ;; meta part
  (label node-label)
  (type node-type)
  (meta node-meta set-node-meta!)
  (visited? node-visited? set-node-visited?!)
  )

(define (make-node id children label type)
  (node-ctor id children label type #f #f))
