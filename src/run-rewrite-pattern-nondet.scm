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

%var run-rewrite-pattern/nondet

%use (raisu) "./euphrates/raisu.scm"
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"

%use (set-node-children! node-children) "./node.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"
%use (variable-get-association-or/nondet) "./variable-get-association-or-nondet.scm"
%use (variable-get-association-nondet-singleton) "./variable-get-association-nondet-singleton.scm"

(define (run-rewrite-pattern/nondet replace-pattern main-input)
  (define (loop P)
    (or (variable-get-association-or/nondet P #f)
        (list (make-fresh-branch-node
               (list-map/flatten loop (node-children P))))))

  (let ((replace-pattern-val
         (or
          (variable-get-association-nondet-singleton replace-pattern replace-pattern #f)
          (raisu 'expected-singleton-match replace-pattern))))
    (unless (node-equal? main-input replace-pattern-val)
      (let ((new-children
             (list-map/flatten
              loop (node-children replace-pattern-val))))
        (set-node-children! main-input new-children)))))
