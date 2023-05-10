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
  (define-module (schrec find-sorted-eval-likes)
    :export (find-sorted-eval-likes)
    :use-module ((euphrates comp) :select (comp))
    :use-module ((euphrates list-or-map) :select (list-or-map))
    :use-module ((schrec eval-like-huh) :select (eval-like?))
    :use-module ((schrec node) :select (node-children node-visited? set-node-visited?!))
    )))



;; returns all eval nodes in a bottommost-to-topmost order
(define (find-sorted-eval-likes names graph)
  (reverse
   (let loop ((parent #f) (graph graph))
     (if (node-visited? graph) '()
         (begin
           (set-node-visited?! graph #t)
           (let* ((recur (map (comp (loop graph)) (node-children graph)))
                  (ret (apply append recur)))
             (set-node-visited?! graph #f)
             (if (and parent (list-or-map
                              (lambda (name) (eval-like? name parent))
                              names))
                 (cons parent ret)
                 ret)))))))
