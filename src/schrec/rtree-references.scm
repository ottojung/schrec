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
  (define-module (schrec rtree-references)
    :export (rtree-references)
    :use-module ((euphrates rtree) :select (rtree-children rtree-ref rtree-value rtree?))
    )))



(define (rtree-references tree)
  (let loop ((tree tree))
    (if (rtree? tree)
        (cons
         (list (rtree-value tree) (rtree-ref tree))
         (apply append (map loop (rtree-children tree))))
        '())))
