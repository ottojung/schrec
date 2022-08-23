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

%var eval/det

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (check-environment) "./check-environment.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"

(define (eval/det func main-input env body)
  (and (check-environment env)
       (let ((result
              (let loop ((g body))
                (if (node-visited? g) #f
                    (begin
                      (set-node-visited?! g #t)
                      (let ((ret (or (func main-input env body g)
                                     (list-or-map loop (node-children g)))))
                        (set-node-visited?! g #f)
                        ret))))))
         result)))
