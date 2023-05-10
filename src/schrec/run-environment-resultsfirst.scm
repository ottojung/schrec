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
  (define-module (schrec run-environment-resultsfirst)
    :export (run-environment-resultsfirst)
    :use-module ((euphrates comp) :select (comp))
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((euphrates stack) :select (stack->list stack-make))
    :use-module ((schrec eval-hook) :select (eval-hook))
    :use-module ((schrec get-environment-blocks) :select (get-environment-blocks))
    :use-module ((schrec get-environment-constants) :select (get-environment-constants))
    :use-module ((schrec get-environment-input) :select (get-environment-input))
    :use-module ((schrec initialize-const-variables-det) :select (initialize-const-variables/det))
    :use-module ((schrec match-rewrite-block-det) :select (match-rewrite-block/det))
    :use-module ((schrec rewrite-rewrite-block-det) :select (rewrite-rewrite-block/det))
    :use-module ((schrec uninitialize-variable-bang) :select (uninitialize-variable!))
    )))



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
