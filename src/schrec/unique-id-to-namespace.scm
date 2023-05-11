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
  (define-module (schrec unique-id-to-namespace)
    :export (unique-id->namespace)
    :use-module ((euphrates string-split-3) :select (string-split-3))
    :use-module ((euphrates tilda-a) :select (~a))
    :use-module ((schrec root-namespace) :select (root-namespace))
    )))


(define (unique-id->namespace uid)
  (define-values (name sep namespace)
    (string-split-3 "." (~a uid)))
  (if (string-null? sep)
      root-namespace
      (string->symbol namespace)))
