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
  (define-module (schrec load-extension-file)
    :export (load-extension-file)
    :use-module ((euphrates dynamic-load) :select (dynamic-load))
    :use-module ((euphrates file-or-directory-exists-q) :select (file-or-directory-exists?))
    :use-module ((euphrates raisu) :select (raisu))
    )))

(define (load-extension-file filepath)
  (unless (file-or-directory-exists? filepath)
    (raisu 'extension-file-does-not-exist filepath))

  (let* ((manifest-fn (dynamic-load filepath)))
    (load-extension/generic filepath manifest-fn)))
