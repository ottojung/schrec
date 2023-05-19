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
  (define-module (schrec extension-input)
    :export (make-extension-input extension-input? extension-input-selfpath extension-input-selfname extension-input-uniqueid)
    :use-module ((euphrates define-type9) :select (define-type9))
    )))

(define-type9 <extension-input>
  (make-extension-input selfpath selfname uniqueid) extension-input?
  (selfpath extension-input-selfpath)
  (selfname extension-input-selfname)
  (uniqueid extension-input-uniqueid)
  )
