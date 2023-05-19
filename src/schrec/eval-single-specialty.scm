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
  (define-module (schrec eval-single-specialty)
    :export (eval/single-specialty)
    :use-module ((schrec eval-det) :select (eval/det))
    :use-module ((schrec eval-nondet) :select (eval/nondet))
    :use-module ((schrec eval-single-form-huh) :select (eval-single-form?))
    :use-module ((schrec get-current-thread) :select (get-current-thread))
    :use-module ((schrec get-eval-body) :select (get-eval-body))
    :use-module ((schrec get-eval-env) :select (get-eval-env))
    :use-module ((schrec keyword-eval-single) :select (keyword-eval-single))
    :use-module ((schrec run-environment-resultsfirst) :select (run-environment-resultsfirst))
    )))

(define (single-runner env body pointer-node)
  (if (run-environment-resultsfirst env body pointer-node)
      (list (get-current-thread))
      '()))

(define (run/det-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/det run-environment-resultsfirst env body))

(define (run/nondet-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/nondet single-runner env body))

(define (run/random-fn eval-node)
  (define env (get-eval-env eval-node))
  (define body (get-eval-body eval-node))
  (eval/det run-environment-resultsfirst env body))

(define eval/single-specialty
  (lambda (input)
    `((manifestversion . 1)
      (name . ,keyword-eval-single)
      (check-fn . ,eval-single-form?)
      (run/det-fn . ,run/det-fn)
      (run/nondet-fn . ,run/nondet-fn)
      (run/random-fn . ,run/random-fn))))
