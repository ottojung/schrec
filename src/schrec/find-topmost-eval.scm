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

(cond-expand
 (guile
  (define-module (find-topmost-eval)
    :export (find-topmost-eval)
    :use-module ((eval-single-form-huh) :select (eval-single-form?))
    :use-module ((node) :select (node-children node-visited? set-node-visited?!))
    )))



;; returns either the eval node, or #f
;; FIXME: abort if graph loops into itself!
(define (find-topmost-eval graph)
  (let loop ((parent #f) (graph graph))
    (if (node-visited? graph) #f
        (begin
          (set-node-visited?! graph #t)
          (let ((ret
                 (if (eval-single-form? parent) parent
                     (let cloop ((cs (node-children graph)))
                       (if (null? cs) #f
                           (or (loop graph (car cs))
                               (cloop (cdr cs))))))))
            (set-node-visited?! graph #f)
            ret)))))
