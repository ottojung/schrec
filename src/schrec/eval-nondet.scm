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
  (define-module (eval-nondet)
    :export (eval/nondet)
    :use-module ((node) :select (node-children node-visited? set-node-visited?!))
    :use-module ((thread-fork) :select (thread-fork))
    )))



;; returns a list of new thread ids
(define (eval/nondet func env body)
  (let loop ((g body))
    (if (node-visited? g) '()
        (begin
          (set-node-visited?! g #t)
          (let ((ret
                 (apply
                  append
                  (cons
                   (thread-fork
                    (func env body g))
                   (map loop (node-children g))))))
            (set-node-visited?! g #f)
            ret)))))
