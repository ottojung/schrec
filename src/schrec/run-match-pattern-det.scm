;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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
  (define-module (run-match-pattern-det)
    :export (run-match-pattern-det)
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((associate-variable-bang-det) :select (associate-variable!/det))
    :use-module ((node-equal-huh) :select (node-equal?))
    :use-module ((node) :select (node-children))
    :use-module ((variable-get-association-or-det) :select (variable-get-association-or-det))
    )))



(define (run-match-pattern-det free-stack match-node input-node)
  (let loop ((match-node match-node) (input-node input-node))
    (let ((match-val (variable-get-association-or-det match-node #f)))
      (if match-val
          (node-equal? match-val input-node)
          (let ((mchildren (node-children match-node))
                (ichildren (node-children input-node)))
            (associate-variable!/det free-stack match-node input-node)
            (or (null? mchildren) ;; NOTE(null-wildcard): because of this, we don't have a check for a node that has zero children.
                (list-and-map loop mchildren ichildren)))))))
