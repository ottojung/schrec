;;;; Copyright (C) 2022, 2023 Otto Jung
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
  (define-module (schrec initialize-const-variables-det)
    :export (initialize-const-variables/det)
    :use-module ((schrec associate-variable-bang-det) :select (associate-variable!/det))
    :use-module ((schrec initialize-const-variables-generic) :select (initialize-const-variables/generic))
    )))



(define initialize-const-variables/det
  (initialize-const-variables/generic associate-variable!/det))
