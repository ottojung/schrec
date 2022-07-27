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

%var find-sorted-evals

%use (comp) "./euphrates/comp.scm"

%use (node-children node-visited? set-node-visited?!) "./node.scm"
%use (eval-form?) "./eval-form-huh.scm"

;; returns all eval nodes in a bottommost-to-topmost order
(define (find-sorted-evals graph)
  (reverse
   (let loop ((parent #f) (graph graph))
     (if (node-visited? graph) '()
         (begin
           (set-node-visited?! graph #t)
           (let* ((recur (map (comp (loop graph)) (node-children graph)))
                  (ret (apply append recur)))
             (set-node-visited?! graph #f)
             (if (and parent (eval-form? parent))
                 (cons parent ret)
                 ret)))))))
