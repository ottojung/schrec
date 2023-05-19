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
  (define-module (schrec readparse-list)
    :export (readparse-list)
    :use-module ((euphrates open-file-port) :select (open-file-port))
    :use-module ((euphrates read-list) :select (read-list))
    )))

(define (readparse-list filepath)
  (define file-port (open-file-port filepath "r"))
  (define parsed (read-list file-port))
  (close-port file-port)
  parsed)
