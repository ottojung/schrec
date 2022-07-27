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

%var run-match-pattern

%use (node-children) "./node.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (variable-get-association-or) "./variable-get-association-or.scm"

(define (run-match-pattern free-stack match-node input-node)
  (let loop ((match-node match-node) (input-node input-node))
    (define input-val
      (variable-get-association-or input-node input-node))

    (let ((match-val (variable-get-association-or match-node #f)))
      (if match-val
          (node-equal? match-val input-val)
          (let ((mchildren (node-children match-node))
                (ichildren (node-children input-val)))
            (associate-free-variable! free-stack match-node input-val)
            (or (null? mchildren) ;; NOTE(null-wildcard): because of this, we don't have a check for a node that has zero children.
                (list-and-map loop mchildren ichildren)))))))
