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
  (define-module (get-current-match-thread)
    :export (get-current-match-thread)
    :use-module ((current-match-thread-p) :select (current-match-thread/p))
    :use-module ((thread-obj) :select (thread-obj-ctr))
    )))



(define root-match-thread
  (thread-obj-ctr '()))

(define (get-current-match-thread)
  (or (current-match-thread/p) root-match-thread))
