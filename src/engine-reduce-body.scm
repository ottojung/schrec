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

%var engine-reduce-body

%use (run-environment) "./run-environment.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"
%use (check-environment) "./check-environment.scm"
%use (reduce-hook) "./reduce-hook.scm"
%use (get-current-thread) "./get-current-thread.scm"
%use (engine-fork) "./engine-fork.scm"

;; returns a list of new thread ids
(define (engine-reduce-body env body)
  (if (check-environment env)
      (let loop ((g body))
        (if (node-visited? g) '()
            (begin
              (set-node-visited?! g #t)
              (let ((ret
                     (apply
                      append
                      (cons
                       (engine-fork
                        (if (run-environment env g)
                            (begin
                              (when (reduce-hook)
                                ((reduce-hook) body))
                              (list (get-current-thread)))
                            '()))
                       (map loop (node-children g))))))
                (set-node-visited?! g #f)
                ret))))
      '()))
