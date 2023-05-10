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

%var find-sorted-eval-likes

%use (comp) "./euphrates/comp.scm"
%use (list-or-map) "./euphrates/list-or-map.scm"
%use (eval-like?) "./eval-like-huh.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"

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
