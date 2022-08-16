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

%var eval/det-topdown/node/loop

%use (raisu) "./euphrates/raisu.scm"

%use (eval/det-topdown) "./eval-det-topdown.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (eval-single-form?) "./eval-single-form-huh.scm"
%use (eval-multi-form?) "./eval-multi-form-huh.scm"
%use (run-environment) "./run-environment.scm"
%use (run-environment/multi) "./run-environment-multi.scm"

(define (eval/det-topdown/node/loop eval-node)
  (cond
   ((eval-single-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node)))
      (let loop ((evaled? #f))
        (if (eval/det-topdown run-environment env body)
            (loop #t)
            evaled?))))
   ((eval-multi-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node)))
      (let loop ((evaled? #f))
        (if (eval/det-topdown run-environment/multi env body)
            (loop #t)
            evaled?))))
   (else #f)))
