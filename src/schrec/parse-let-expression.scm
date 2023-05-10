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
  (define-module (parse-let-expression)
    :export (parse-let-expression)
    :use-module ((euphrates fp) :select (fp))
    :use-module ((euphrates lexical-scope) :select (lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!))
    :use-module ((get-let-bindings) :select (get-let-bindings))
    :use-module ((get-let-body) :select (get-let-body))
    :use-module ((make-fresh-namespace) :select (make-fresh-namespace))
    :use-module ((make-fresh-regular-node) :select (make-fresh-regular-node))
    :use-module ((node) :select (node-children node-label set-node-children!))
    :use-module ((transform-let-bindings) :select (transform-let-bindings))
    )))



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
