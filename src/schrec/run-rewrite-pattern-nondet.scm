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
  (define-module (schrec run-rewrite-pattern-nondet)
    :export (run-rewrite-pattern-nondet)
    :use-module ((euphrates list-map-flatten) :select (list-map/flatten))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((node-equal-huh) :select (node-equal?))
    :use-module ((node) :select (node-children set-node-children!))
    :use-module ((variable-get-association-nondet-singleton) :select (variable-get-association-nondet-singleton))
    :use-module ((variable-get-association-or-nondet) :select (variable-get-association-or-nondet))
    )))



(define (run-rewrite-pattern-nondet replace-pattern main-input)
  (define (loop P)
    (or (variable-get-association-or-nondet P #f)
        ;; FIXME: remember association of of `P -> this new nodes`
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
