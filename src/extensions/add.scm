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
  (define-module (extensions add)
    :use-module ((schrec get-current-thread) :select (get-current-thread))
    :use-module ((schrec make-fresh-atom-node) :select (make-fresh-atom-node))
    :use-module ((schrec node) :select (node-children node-label set-node-children!))
    :use-module ((schrec temporary-namespace) :select (temporary-namespace))
    )))

(define (add-handler g)
  (define cs (node-children g))
  (define an (list-ref cs 1))
  (define bn (list-ref cs 2))
  (define a (node-label an))
  (define b (node-label bn))
  (define c (make-fresh-atom-node (+ a b) temporary-namespace))
  (set-node-children! g (list c))
  g)

(define (add-handler/multi g)
  (add-handler g)
  (list (get-current-thread)))

(define (add-check-fn self g)
  (define cs (node-children g))
  (define an (list-ref cs 1))
  (define bn (list-ref cs 2))
  (define a (node-label an))
  (define b (node-label bn))
  (and (= 3 (length cs))
       (number? a)
       (number? b)))

(lambda (input)
  `((manifestversion . 1)
    (name . add)
    (check-fn . ,add-check-fn)
    (run/det-fn . ,add-handler)
    (run/nondet-fn . ,add-handler/multi)
    (run/random-fn . ,add-handler)))
