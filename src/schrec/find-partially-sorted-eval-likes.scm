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
  (define-module (find-partially-sorted-eval-likes)
    :export (find-partially-sorted-eval-likes)
    :use-module ((euphrates comp) :select (comp))
    :use-module ((euphrates list-and-map) :select (list-and-map))
    :use-module ((euphrates list-or-map) :select (list-or-map))
    :use-module ((eval-like-huh) :select (eval-like?))
    :use-module ((node) :select (node-children node-visited? set-node-visited?!))
    )))



;; FIXME: This is wrong. There are no "levels".
;;        If bottom eval fails, then the top one must run
;;        instead, on the same reduction step.
(define (find-partially-sorted-eval-likes names root)
  (define sequences '())
  (let loop ((parents '()) (graph root))
    (unless (node-visited? graph)
      (set-node-visited?! graph #t)
      (let* ((like? (list-or-map
                     (lambda (name) (eval-like? name graph))
                     names))
             (new-parents (if like? (cons graph parents) parents)))
        (for-each (comp (loop new-parents))
                  (node-children graph))
        (set-node-visited?! graph #f)
        (when like?
          (set! sequences (cons (cons graph parents) sequences))))))

  (let loop ((sequences sequences))
    (if (null? sequences) '()
        (let* ((cars (map car sequences))
               (new-seq
                (filter (negate null?)
                        (map cdr sequences)))
               (filtered-cars
                (filter
                 (lambda (x)
                   (list-and-map
                    (lambda (s)
                      (not (memq x s)))
                    new-seq))
                 cars)))
          (cons filtered-cars (loop new-seq))))))

