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

%var eval-single-form?

%use (list-length=) "./euphrates/list-length-eq.scm"
%use (check-environment) "./check-environment.scm"
%use (eval-single-node?) "./eval-single-node-huh.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (node-children) "./node.scm"

(define (eval-single-form? node)
  (define children (node-children node))
  (and (list-length= 3 children)
       (eval-single-node? (car children))
       (check-environment (get-eval-env node))))
