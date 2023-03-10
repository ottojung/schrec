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

%var parse-let-expression

%use (fp) "./euphrates/fp.scm"
%use (lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!) "./euphrates/lexical-scope.scm"
%use (get-let-bindings) "./get-let-bindings.scm"
%use (get-let-body) "./get-let-body.scm"
%use (make-fresh-namespace) "./make-fresh-namespace.scm"
%use (make-fresh-regular-node) "./make-fresh-regular-node.scm"
%use (node-children node-label set-node-children!) "./node.scm"
%use (transform-let-bindings) "./transform-let-bindings.scm"

(define (parse-let-expression scope loop lst)
  (define let-bindings-0 (get-let-bindings lst))
  (define let-bindings (transform-let-bindings let-bindings-0))
  (define let-body (get-let-body lst))
  (define namespace (make-fresh-namespace))

  (define binding-nodes
    (map
     (fp (name value)
         (if (or (null? value) (pair? value))
             (list (make-fresh-regular-node name namespace '()) value) ;; TODO: maybe branch node?
             (list name value)))
     let-bindings))

  (lexical-scope-stage! scope namespace)

  (for-each
   (fp (name value)
       (if (or (null? value) (pair? value))
           (lexical-scope-set!
            scope (node-label name)
            name)
           (lexical-scope-set!
            scope name
            (loop value))))
   binding-nodes)

  (for-each
   (fp (binding-node value)
       (when (pair? value)
         (let ((ret (loop value)))
           (set-node-children! binding-node (node-children ret)))))
   binding-nodes)

  (let ((result (loop let-body)))
    (lexical-scope-unstage! scope)
    result))
