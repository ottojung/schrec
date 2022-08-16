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

%var eval/nondet/node

%use (eval/nondet) "./eval-nondet.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (eval-single-form?) "./eval-single-form-huh.scm"
%use (eval-multi-form?) "./eval-multi-form-huh.scm"
%use (run-environment) "./run-environment.scm"
%use (run-environment/nondet) "./run-environment-nondet.scm"
%use (get-current-thread) "./get-current-thread.scm"

(define (single-runner env g body)
  (if (run-environment env g body)
      (list (get-current-thread))
      '()))

(define multi-runner run-environment/nondet)

(define (eval/nondet/node eval-node)
  (cond
   ((eval-single-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node)))
      (eval/nondet single-runner env body)))
   ((eval-multi-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node)))
      (eval/nondet multi-runner env body)))
   (else '())))