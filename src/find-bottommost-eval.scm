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

%var find-bottommost-eval

%use (node-id node-children node-visited? set-node-visited?!) "./node.scm"
%use (eval-form?) "./eval-form-huh.scm"
%use (get-eval-body) "./get-eval-body.scm"

;; returns either the eval node, or #f
;; FIXME: abort if graph loops into itself!
(define (find-bottommost-eval graph)
  (let loop ((parent #f) (graph graph))
    (if (node-visited? graph) #f
        (begin
          (set-node-visited?! graph #t)
          (let* ((ret1
                  (if (eval-form? parent) parent
                      (let cloop ((cs (node-children graph)))
                        (if (null? cs) #f
                            (or (loop graph (car cs))
                                (cloop (cdr cs)))))))
                 (ret2 (and ret1 (loop #f (get-eval-body ret1))))
                 (ret (or ret2 ret1)))
            (set-node-visited?! graph #f)
            ret)))))
