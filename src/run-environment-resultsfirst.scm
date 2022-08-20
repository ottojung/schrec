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

%var run-environment-resultsfirst

%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack-make stack->list) "./euphrates/stack.scm"

%use (node-children) "./node.scm"
%use (match-rewrite-block/det) "./match-rewrite-block-det.scm"
%use (rewrite-rewrite-block/det) "./rewrite-rewrite-block-det.scm"
%use (associate-variable!/det) "./associate-variable-bang-det.scm"
%use (uninitialize-variable!) "./uninitialize-variable-bang.scm"
%use (eval-hook) "./eval-hook.scm"
%use (block-fn) "./block-fn.scm"

(define (run-environment-resultsfirst main-input env body pointer-node)
  (define free-stack (stack-make))
  (define blocks (node-children env))

  (define result
    (and
     (or (associate-variable!/det free-stack main-input pointer-node) #t)
     (list-and-map (block-fn match-rewrite-block/det free-stack) blocks)
     (for-each (block-fn rewrite-rewrite-block/det free-stack) blocks)))

  (for-each uninitialize-variable!
            (stack->list free-stack))

  (when result
    (let ((hook (eval-hook)))
      (when hook (hook body))))

  result)
