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
  (define-module (schrec load-extension)
    :export (load-extension)
    :use-module ((euphrates assq-or) :select (assq-or))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((euphrates stack) :select (stack-push! stack?))
    :use-module ((schrec extension) :select (make-extension))
    :use-module ((schrec loaded-extensions-p) :select (loaded-extensions/p))
    )))

(define (load-extension manifest)
  (define existing (loaded-extensions/p))
  (define (get name)
    (assq-or
     name manifest
     (raisu 'extension-manifest-missing-a-field
            name manifest)))

  (unless (stack? existing)
    (raisu 'expected-extensions-list-to-be-an-instatiated-stack
           existing
           manifest))

  (let ((ext
         (make-extension
          (get 'name)
          (get 'check-fn)
          (get 'run/det-fn)
          (get 'run/nondet-fn)
          (get 'run/random-fn))))

    (stack-push! existing ext)

    #f))
