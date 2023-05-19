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
  (define-module (schrec specialty)
    :export (make-specialty specialty? specialty-uniqueid specialty-name specialty-check specialty-run/det specialty-run/nondet specialty-run/random specialty-check-fn specialty-run/det-fn specialty-run/nondet-fn specialty-run/random-fn)
    :use-module ((euphrates define-type9) :select (define-type9))
    )))

(define-type9 <specialty>
  (make-specialty uniqueid name check-fn run/det-fn run/nondet-fn run/random-fn) specialty?
  (uniqueid specialty-uniqueid)
  (name specialty-name)
  (check-fn specialty-check-fn)
  (run/det-fn specialty-run/det-fn)
  (run/nondet-fn specialty-run/nondet-fn)
  (run/random-fn specialty-run/random-fn)
  )

(define (specialty-check ext self g)
  ((specialty-check-fn ext) self g))

(define (specialty-run/det ext g)
  ((specialty-run/det-fn ext) g))

(define (specialty-run/nondet ext g)
  ((specialty-run/nondet-fn ext) g))

(define (specialty-run/random ext g)
  ((specialty-run/random-fn ext) g))
