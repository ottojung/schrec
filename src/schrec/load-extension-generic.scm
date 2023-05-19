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
  (define-module (schrec load-extension-generic)
    :export (load-extension/generic)
    :use-module ((euphrates assq-or) :select (assq-or))
    :use-module ((euphrates hashmap) :select (hashmap-set! hashmap?))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec extension-input) :select (make-extension-input))
    :use-module ((schrec extension) :select (make-extension))
    :use-module ((schrec loaded-extensions-p) :select (loaded-extensions/p))
    )))

(define get-new-extension-id
  (let ((counter 0))
    (lambda _
      (set! counter (+ 1 counter))
      counter)))

(define (load-extension/generic filepath selfname manifest-fn)
  (define uniqueid (get-new-extension-id))
  (define input (make-extension-input filepath selfname uniqueid))
  (define manifest (manifest-fn input))
  (define existing (loaded-extensions/p))

  (define (get key)
    (assq-or
     key manifest
     (raisu 'extension-manifest-missing-a-field
            key manifest)))

  (define name (or selfname (get 'name)))

  (unless (hashmap? existing)
    (raisu 'expected-extensions-list-to-be-an-instatiated-hashmap
           existing
           manifest))

  (let ((version (get 'manifestversion))
        (expected 1))
    (unless (equal? version expected)
      (raisu 'extension-version-mismatch version expected)))

  (let ((ext
         (make-extension
          uniqueid
          name
          (get 'check-fn)
          (get 'run/det-fn)
          (get 'run/nondet-fn)
          (get 'run/random-fn))))

    (hashmap-set! existing name ext)

    #f))
