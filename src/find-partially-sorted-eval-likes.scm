;;;; Copyright (C) 2022  Otto Jung
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

%run guile

%var find-partially-sorted-eval-likes

%use (comp) "./euphrates/comp.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (list-or-map) "./euphrates/list-or-map.scm"
%use (eval-like?) "./eval-like-huh.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"

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

