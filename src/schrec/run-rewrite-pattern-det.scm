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

(cond-expand
 (guile
  (define-module (run-rewrite-pattern-det)
    :export (run-rewrite-pattern/det)
    :use-module ((make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((node-equal-huh) :select (node-equal?))
    :use-module ((node) :select (node-children set-node-children!))
    :use-module ((variable-get-association-or-det) :select (variable-get-association-or-det))
    )))



(define (run-rewrite-pattern/det replace-pattern main-input)
  (define (loop P)
    (or (variable-get-association-or-det P #f)
        ;; FIXME: remember association of of `P -> this new node`
        (make-fresh-branch-node
         (map loop (node-children P)))))

  (let ((replace-pattern-val
         (variable-get-association-or-det
          replace-pattern replace-pattern)))
    (unless (node-equal? replace-pattern-val main-input)
      (let ((new-children
             (map loop (node-children replace-pattern-val))))
        (set-node-children! main-input new-children)))))
