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

%var block-fn

%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"

(define (block-fn fn free-stack main-input)
  (lambda (block)
    (and
     (initialize-rewrite-block free-stack block main-input)
     (let ((ret (fn free-stack block main-input)))
       (uninitialize-rewrite-block free-stack block main-input)
       ret))))
