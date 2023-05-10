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

(cond-expand
 (guile
  (define-module (rewrite-rewrite-block-det)
    :export (rewrite-rewrite-block/det)
    :use-module ((get-block-input) :select (get-block-input))
    :use-module ((get-block-rpattern) :select (get-block-rpattern))
    :use-module ((run-rewrite-pattern-det) :select (run-rewrite-pattern/det))
    :use-module ((variable-get-association-or-det) :select (variable-get-association-or-det))
    )))



(define (rewrite-rewrite-block/det free-stack block)
  (define input-node (get-block-input block))
  (define replace-pattern (get-block-rpattern block))

  (define input-val
    (variable-get-association-or-det input-node input-node))

  (run-rewrite-pattern/det replace-pattern input-val))
