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
  (define-module (schrec extension)
    :export (make-extension extension? extension-uniqueid extension-name extension-check extension-run/det extension-run/nondet extension-run/random extension-check-fn extension-run/det-fn extension-run/nondet-fn extension-run/random-fn)
    :use-module ((euphrates define-type9) :select (define-type9))
    )))

(define-type9 <extension>
  (make-extension uniqueid name check-fn run/det-fn run/nondet-fn run/random-fn) extension?
  (uniqueid extension-uniqueid)
  (name extension-name)
  (check-fn extension-check-fn)
  (run/det-fn extension-run/det-fn)
  (run/nondet-fn extension-run/nondet-fn)
  (run/random-fn extension-run/random-fn)
  )

(define (extension-check ext self g)
  ((extension-check-fn ext) self g))

(define (extension-run/det ext g)
  ((extension-run/det-fn ext) g))

(define (extension-run/nondet ext g)
  ((extension-run/nondet-fn ext) g))

(define (extension-run/random ext g)
  ((extension-run/random-fn ext) g))
