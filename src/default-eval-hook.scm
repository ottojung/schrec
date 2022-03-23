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

%var default-eval-hook

%use (pretty-print-graph) "./pretty-print-graph.scm"

%for (COMPILER "guile")
(use-modules (ice-9 pretty-print))
%end

(define (default-eval-hook original-graph)
  (lambda (g)
    (display "\nStep:\n" (current-error-port))
    (pretty-print-graph original-graph)))


