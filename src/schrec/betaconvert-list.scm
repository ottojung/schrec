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
  (define-module (schrec betaconvert-list)
    :export (betaconvert-list)
    :use-module ((euphrates hashmap) :select (hashmap-ref hashmap-set! make-hashmap))
    :use-module ((schrec betaconvert-let-expression) :select (betaconvert-let-expression))
    :use-module ((schrec check-let-syntax) :select (check-let-syntax))
    :use-module ((schrec flattenme-flatten) :select (flattenme-flatten))
    :use-module ((schrec let-expression-huh) :select (let-expression?))
    :use-module ((schrec make-fresh-atom-node) :select (make-fresh-atom-node))
    :use-module ((schrec make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((schrec make-unique-id) :select (make-unique-id))
    :use-module ((schrec root-namespace) :select (root-namespace))
    )))


(define (betaconvert-list list-of-roots)
  (define valuation (make-hashmap))
  (define (loop lst)
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (betaconvert-let-expression valuation loop lst))
            (make-fresh-branch-node
             (flattenme-flatten
              (map loop lst))))
        (let ((existing (hashmap-ref valuation lst #f)))
          (or existing
              (let ((new (make-fresh-atom-node lst root-namespace))
                    (key (make-unique-id lst root-namespace)))
                (hashmap-set! valuation key new)
                new)))))

  ;; Adding a join-root at the top.
  ;; It should be removed afterwards.

  (define roots
    (flattenme-flatten
     (map loop list-of-roots)))

  (define root-node
    (make-fresh-branch-node roots))

  root-node)
