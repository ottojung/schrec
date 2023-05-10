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

%use (comp) "./euphrates/comp.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (stack->list stack-make) "./euphrates/stack.scm"
%use (eval-hook) "./eval-hook.scm"
%use (get-environment-blocks) "./get-environment-blocks.scm"
%use (get-environment-constants) "./get-environment-constants.scm"
%use (get-environment-input) "./get-environment-input.scm"
%use (initialize-const-variables/det) "./initialize-const-variables-det.scm"
%use (match-rewrite-block/det) "./match-rewrite-block-det.scm"
%use (rewrite-rewrite-block/det) "./rewrite-rewrite-block-det.scm"
%use (uninitialize-variable!) "./uninitialize-variable-bang.scm"

(define (run-environment-resultsfirst env body pointer-node)
  (define blocks (get-environment-blocks env))
  (define constants (get-environment-constants env))
  (define main-input (get-environment-input env))
  (define free-stack (stack-make))

  ;; FIXME: copy the replace pattern first.
  (define result
    (and
     (initialize-const-variables/det free-stack constants main-input pointer-node)
     (list-and-map (comp (match-rewrite-block/det free-stack)) blocks)
     (for-each (comp (rewrite-rewrite-block/det free-stack)) blocks)))

  (for-each uninitialize-variable!
            (stack->list free-stack))

  (when result
    (let ((hook (eval-hook)))
      (when hook (hook env body pointer-node))))

  result)
