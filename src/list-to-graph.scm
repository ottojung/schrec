;;;; Copyright (C) 2021  Otto Jung
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

%var list->graph

%use (make-node) "./node.scm"
%use (lexical-scope-make lexical-scope-ref lexical-scope-set! lexical-scope-namespace) "./euphrates/lexical-scope.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"
%use (make-fresh-atom-node) "./make-fresh-atom-node.scm"
%use (let-expression?) "./let-expression-huh.scm"
%use (check-let-syntax) "./check-let-syntax.scm"
%use (parse-let-expression) "./parse-let-expression.scm"
%use (root-namespace) "./root-namespace.scm"

(define (list->graph lst)
  (define scope (lexical-scope-make root-namespace))
  (let loop ((lst lst))
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (parse-let-expression scope loop lst))
            (make-fresh-branch-node (map loop lst)))
        (let ((existing (lexical-scope-ref scope lst #f)))
          (or existing
              (let* ((new (make-fresh-atom-node (cons lst root-namespace))))
                (lexical-scope-set! scope root-namespace lst new)
                new))))))
