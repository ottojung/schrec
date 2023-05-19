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
  (define-module (schrec eval-resultsfirst-node-loop)
    :export (eval/resultsfirst/node/loop)
    :use-module ((schrec extension) :select (extension-check extension-run/det))
    :use-module ((schrec node) :select (node-children node-specialty))
    )))



(define (eval/resultsfirst/node/loop eval-node)
  (define childs (node-children eval-node))
  (define self (car childs))
  (define specialty (node-specialty self))
  (and (extension-check specialty self eval-node)
      (let loop ((evaled? #f))
        (if (extension-run/det specialty eval-node)
            (loop #t)
            evaled?))))
