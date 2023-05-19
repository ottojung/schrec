;;;; Copyright (C) 2021, 2022, 2023 Otto Jung
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
  (define-module (schrec eval-det)
    :export (eval/det)
    :use-module ((euphrates list-or-map) :select (list-or-map))
    :use-module ((schrec check-environment) :select (check-environment))
    :use-module ((schrec node) :select (node-children node-visited? set-node-visited?!))
    )))



(define (eval/det func env body)
  (and (check-environment env) ;; FIXME: this is a redundant check
       (let ((result
              (let loop ((g body))
                (if (node-visited? g) #f
                    (begin
                      (set-node-visited?! g #t)
                      (let ((ret (or (func env body g)
                                     (list-or-map loop (node-children g)))))
                        (set-node-visited?! g #f)
                        ret))))))
         result)))
