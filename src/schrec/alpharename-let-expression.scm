;;;; Copyright (C) 2023 Otto Jung
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
  (define-module (schrec alpharename-let-expression)
    :export (alpharename-let-expression)
    :use-module ((euphrates fp) :select (fp))
    :use-module ((euphrates lexical-scope) :select (lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec flattenme-mapflatten) :select (flattenme-mapflatten))
    :use-module ((schrec flattenme) :select (flattenme?))
    :use-module ((schrec get-let-bindings) :select (get-let-bindings))
    :use-module ((schrec get-let-bodies) :select (get-let-bodies))
    :use-module ((schrec make-fresh-namespace) :select (make-fresh-namespace))
    :use-module ((schrec make-let-form) :select (make-let-form))
    :use-module ((schrec make-unique-id) :select (make-unique-id))
    :use-module ((schrec transform-let-bindings) :select (transform-let-bindings))
    :use-module ((schrec unique-id-to-name) :select (unique-id->name))
    )))



(define (alpharename-let-expression scope loop lst)
  (define let-bindings-0 (get-let-bindings lst))
  (define let-bindings (transform-let-bindings let-bindings-0))
  (define let-bodies (get-let-bodies lst))
  (define namespace (make-fresh-namespace))

  (define binding-nodes
    (map
     (fp (name value)
         (if (or (null? value) (pair? value))
             (list (make-unique-id name namespace) value)
             (list name value)))
     let-bindings))

  (lexical-scope-stage! scope namespace)

  (for-each
   (fp (name value)
       (if (or (null? value) (pair? value))
           (lexical-scope-set!
            scope (unique-id->name name)
            name)
           (lexical-scope-set!
            scope name
            (loop value))))
   binding-nodes)

  (let ()
    (define new-bindings
      (filter
       identity
       (map
        (fp (name value)
            (and (or (null? value) (pair? value))
                 (list
                  name
                  (let ((r (loop value)))
                    (when (flattenme? r)
                      (raisu 'expected-single-value-for-a-binding binding-node ret))
                    r))))
        binding-nodes)))

    (define new-bodies
      (flattenme-mapflatten loop let-bodies))
    (define result (make-let-form new-bindings new-bodies))

    (lexical-scope-unstage! scope)

    result))
