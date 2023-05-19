;;;; Copyright (C) 2023 Otto Jung
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
  (define-module (schrec eval-specialty)
    :export (eval-specialty)
    :use-module ((schrec eval-det) :select (eval/det))
    :use-module ((schrec eval-multi-form-huh) :select (eval-multi-form?))
    :use-module ((schrec eval-nondet) :select (eval/nondet))
    :use-module ((schrec get-eval-body) :select (get-eval-body))
    :use-module ((schrec get-eval-env) :select (get-eval-env))
    :use-module ((schrec keyword-eval-multi) :select (keyword-eval-multi))
    :use-module ((schrec run-environment-resultsfirst-multi) :select (run-environment-resultsfirst/multi))
    :use-module ((schrec run-environment-resultsrandom) :select (run-environment-resultsrandom))
    )))

(define (run/det-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/det run-environment-resultsfirst/multi env body))

(define (run/nondet-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/nondet multi-runner env body))

(define (run/random-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/det run-environment-resultsrandom env body))

(define eval-specialty
  (lambda (input)
    `((manifestversion . 1)
      (name . ,keyword-eval-multi)
      (check-fn . ,eval-multi-form?)
      (run/det-fn . ,run/det-fn)
      (run/nondet-fn . ,run/nondet-fn)
      (run/random-fn . ,run/random-fn))))
