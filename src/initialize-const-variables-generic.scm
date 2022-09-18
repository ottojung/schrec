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

%var initialize-const-variables/generic

%use (comp) "./euphrates/comp.scm"
%use (list-or-map) "./euphrates/list-or-map.scm"
%use (node-equal?) "./node-equal-huh.scm"

(define (initialize-const-variables/generic assign)
  (lambda (free-stack constants main-input pointer-node)
    (if (and (list-or-map
              (comp (node-equal? main-input))
              constants)
             (not (node-equal? main-input pointer-node)))
        #f ;; \phi is not a function in this case
        (begin
          (assign free-stack main-input (list pointer-node))

          (for-each
           (lambda (const)
             (unless (node-equal? const main-input)
               (assign free-stack const (list const))))
           constants)

          #t))))
