;;;; Copyright (C) 2021  Otto Jung
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

%var check-environment

%use (or-expression?) "./or-expression-huh.scm"
%use (and-expression?) "./and-expression-huh.scm"
%use (check-rewrite-block) "./check-rewrite-block.scm"

;; returns #f or success
(define (check-environment env)
  (let loop ((env env))
    (cond
     ((or-expression? env) #f)
     ((and-expression? env) #f)
     (else (check-rewrite-block env)))))
