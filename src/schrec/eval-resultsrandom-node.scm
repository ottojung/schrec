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
  (define-module (schrec eval-resultsrandom-node)
    :export (eval/resultsrandom/node)
    :use-module ((schrec eval-det) :select (eval/det))
    :use-module ((schrec eval-multi-form-huh) :select (eval-multi-form?))
    :use-module ((schrec eval-single-form-huh) :select (eval-single-form?))
    :use-module ((schrec get-eval-body) :select (get-eval-body))
    :use-module ((schrec get-eval-env) :select (get-eval-env))
    :use-module ((schrec get-eval-input) :select (get-eval-input))
    :use-module ((schrec run-environment-resultsfirst) :select (run-environment-resultsfirst))
    :use-module ((schrec run-environment-resultsrandom) :select (run-environment-resultsrandom))
    )))



(define (eval/resultsrandom/node eval-node)
  (cond
   ((eval-single-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node)))
      (eval/det run-environment-resultsfirst env body)))
   ((eval-multi-form? eval-node)
    (let ((env (get-eval-env eval-node))
          (body (get-eval-body eval-node))
          (main-input (get-eval-input eval-node)))
      (eval/det run-environment-resultsrandom env body)))
   (else #f)))
