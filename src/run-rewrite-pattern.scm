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

%var run-rewrite-pattern

%use (make-node set-node-children! node-children) "./node.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"

(define (run-rewrite-pattern input-node replace-pattern0)
  (define (loop P)
    (if (free-variable? P)
        (if (free-variable-associated? P)
            (free-variable-get-association P)
            (make-fresh-branch-node
             (map loop (node-children P))))
        P))

  (define new-children
    (map loop (node-children replace-pattern0)))

  (set-node-children! input-node new-children))
