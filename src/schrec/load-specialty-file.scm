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
  (define-module (schrec load-specialty-file)
    :export (load-specialty-file)
    :use-module ((euphrates dynamic-load) :select (dynamic-load))
    :use-module ((euphrates file-or-directory-exists-q) :select (file-or-directory-exists?))
    :use-module ((euphrates raisu) :select (raisu))
    )))

(define (load-specialty-file selfname filepath)
  (unless (file-or-directory-exists? filepath)
    (raisu 'specialty-file-does-not-exist filepath))

  (let* ((manifest-fn (dynamic-load filepath)))
    (load-specialty/generic filepath selfname manifest-fn)))
