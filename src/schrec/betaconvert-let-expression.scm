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
  (define-module (schrec betaconvert-let-expression)
    :export (betaconvert-let-expression)
    :use-module ((euphrates fp) :select (fp))
    :use-module ((euphrates hashmap) :select (hashmap-set!))
    :use-module ((euphrates list-singleton-q) :select (list-singleton?))
    :use-module ((schrec flattenme) :select (make-flattenme))
    :use-module ((schrec get-let-bindings) :select (get-let-bindings))
    :use-module ((schrec get-let-bodies) :select (get-let-bodies))
    :use-module ((schrec make-fresh-regular-node) :select (make-fresh-regular-node))
    :use-module ((schrec make-unique-id) :select (make-unique-id))
    :use-module ((schrec node) :select (node-children node-label node-namespace set-node-children!))
    :use-module ((schrec transform-let-bindings) :select (transform-let-bindings))
    :use-module ((schrec unique-id-to-name) :select (unique-id->name))
    :use-module ((schrec unique-id-to-namespace) :select (unique-id->namespace))
    )))



(define (betaconvert-let-expression valuation loop lst)
  (define let-bindings-0 (get-let-bindings lst))
  (define let-bindings (transform-let-bindings let-bindings-0))
  (define let-bodies (get-let-bodies lst))

  (define binding-nodes
    (map
     (fp (name value)
         (let* ((namespace (unique-id->namespace name))
                (label (unique-id->name name))
                (node (make-fresh-regular-node label namespace '())))
           (list node value)))
     let-bindings))

  (for-each
   (fp (node value)
       (let* ((name (node-label node))
              (namespace (node-namespace node))
              (uid (make-unique-id name namespace)))
         (if (or (null? value) (pair? value))
             (hashmap-set! valuation uid node)
             (hashmap-set! valuation uid (loop value)))))
   binding-nodes)

  (for-each
   (fp (binding-node value)
       (when (pair? value)
         (let ((ret (loop value)))
           (set-node-children! binding-node (node-children ret)))))
   binding-nodes)

  ;; TODO: everything is flattenme
  (let* ((recur (map loop let-bodies))
         (single? (list-singleton? let-bodies))
         (node (if single?
                   (car recur)
                   (make-flattenme recur))))
    node))
