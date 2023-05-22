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
    :use-module ((schrec betaconvert-let-expression) :select (betaconvert-let-expression))
    :use-module ((schrec check-let-syntax) :select (check-let-syntax))
    :use-module ((schrec flattenme-mapflat) :select (flattenme-mapflat))
    :use-module ((schrec let-expression-huh) :select (let-expression?))
    :use-module ((schrec make-atom-node) :select (make-atom-node))
    :use-module ((schrec make-fresh-branch-node) :select (make-fresh-branch-node))
    :use-module ((schrec rooting-join) :select (rooting-join))
    :use-module ((schrec unique-id-to-name) :select (unique-id->name))
    :use-module ((schrec unique-id-to-namespace) :select (unique-id->namespace))
    )))


(define (betaconvert-list list-of-roots)
  (define (loop lst)
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (betaconvert-let-expression loop lst))
            (make-fresh-branch-node
             (flattenme-mapflat loop lst)))
        (let* ((namespace (unique-id->namespace lst))
               (label (unique-id->name lst)))
          (make-atom-node label namespace))))

  (define roots
    (flattenme-mapflat loop list-of-roots))

  ;; A workaround for evaluation of all the roots
  ;; is to add an additional root at the top that
  ;; joins them all. And then remove
  ;; it when done evaluating.
  (rooting-join roots))
