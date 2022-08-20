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

%var run-rewrite-pattern-resultsall

%use (raisu) "./euphrates/raisu.scm"
%use (list-map/flatten) "./euphrates/list-map-flatten.scm"

%use (set-node-children! node-children) "./node.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"
%use (variable-get-association-or/resultsall) "./variable-get-association-or-resultsall.scm"
%use (variable-get-association-resultsall-singleton) "./variable-get-association-resultsall-singleton.scm"

(define (run-rewrite-pattern-resultsall replace-pattern main-input)
  (define (loop P)
    (or (variable-get-association-or/resultsall P #f)
        (list (make-fresh-branch-node
               (list-map/flatten loop (node-children P))))))

  (let ((replace-pattern-val
         (or
          (variable-get-association-resultsall-singleton replace-pattern replace-pattern #f)
          (raisu 'expected-singleton-match replace-pattern))))
    (unless (node-equal? main-input replace-pattern-val)
      (let ((new-children
             (list-map/flatten
              loop (node-children replace-pattern-val))))
        (set-node-children! main-input new-children)))))
