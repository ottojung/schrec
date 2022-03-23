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

%var reduce-node-topdown

%use (eval/det-topdown) "./eval-det-topdown.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"

(define (reduce-node-topdown eval-node)
  (define env (get-eval-env eval-node)) ;; TODO(eval-syntax): check syntax
  (define body (get-eval-body eval-node))
  (eval/det-topdown env body))
