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

%var eval/resultsall/node

%use (eval-multi-form?) "./eval-multi-form-huh.scm"
%use (eval/nondet) "./eval-nondet.scm"
%use (eval-single-form?) "./eval-single-form-huh.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (get-eval-input) "./get-eval-input.scm"
%use (run-environment-resultsall) "./run-environment-resultsall.scm"
%use (run-environment-resultsfirst) "./run-environment-resultsfirst.scm"

(define (single-runner env body pointer-node)
  (if (run-environment-resultsfirst env body pointer-node)
      (list (get-current-thread))
      '()))

(define multi-runner run-environment-resultsall)

(define (eval/resultsall/node eval-node)
  (cond
   ((eval-single-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node))
          (main-input (get-eval-input eval-node)))
      (eval/nondet single-runner env body)))
   ((eval-multi-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node))
          (main-input (get-eval-input eval-node)))
      (eval/nondet multi-runner env body)))
   (else '())))
