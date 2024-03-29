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
  (define-module (schrec unique-id-to-name)
    :export (unique-id->name)
    :use-module ((euphrates string-split-3) :select (string-split-3))
    :use-module ((euphrates tilda-a) :select (~a))
    :use-module ((euphrates un-tilda-s) :select (un~s))
    )))


(define (unique-id->name uid)
  (define-values (name sep namespace)
    (string-split-3 "." (~a uid)))
  (if (string-null? sep)
      uid
      (un~s name)))
