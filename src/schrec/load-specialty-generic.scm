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
  (define-module (schrec load-specialty-generic)
    :export (load-specialty/generic)
    :use-module ((euphrates assq-or) :select (assq-or))
    :use-module ((euphrates hashmap) :select (hashmap-set! hashmap?))
    :use-module ((euphrates raisu) :select (raisu))
    :use-module ((schrec loaded-specialtys-p) :select (loaded-specialtys/p))
    :use-module ((schrec specialty-input) :select (make-specialty-input))
    :use-module ((schrec specialty) :select (make-specialty))
    )))

(define get-new-specialty-id
  (let ((counter 0))
    (lambda _
      (set! counter (+ 1 counter))
      counter)))

(define (load-specialty/generic filepath manifest-fn)
  (define uniqueid (get-new-specialty-id))
  (define input (make-specialty-input filepath uniqueid))
  (define manifest (manifest-fn input))
  (define existing (loaded-specialtys/p))

  (define (get key)
    (assq-or
     key manifest
     (raisu 'specialty-manifest-missing-a-field
            key manifest)))

  (define name (get 'name))

  (unless (hashmap? existing)
    (raisu 'expected-specialtys-list-to-be-an-instatiated-hashmap
           existing
           manifest))

  (let ((version (get 'manifestversion))
        (expected 1))
    (unless (equal? version expected)
      (raisu 'specialty-version-mismatch version expected)))

  (let ((ext
         (make-specialty
          uniqueid
          name
          (get 'check-fn)
          (get 'run/det-fn)
          (get 'run/nondet-fn)
          (get 'run/random-fn))))

    (hashmap-set! existing name ext)

    #f))
