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

%var eval/det-topdown

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (run-environment) "./run-environment.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"
%use (check-environment) "./check-environment.scm"
%use (reduce-hook) "./reduce-hook.scm"

(define (eval/det-topdown env g)
  (and (check-environment env)
       (let ((result
              (let loop ((g g))
                (if (node-visited? g) #f
                    (begin
                      (set-node-visited?! g #t)
                      (let ((ret (or (run-environment env g)
                                     (list-or-map loop (node-children g)))))
                        (set-node-visited?! g #f)
                        ret))))))
         (when (and result (reduce-hook))
           ((reduce-hook) result))
         result)))
