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

%use (range) "./euphrates/range.scm"
%use (node-children set-node-children! node-label) "./node.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (run-environment) "./run-environment.scm"
%use (eval/det-topdown) "./eval-det-topdown.scm"
%use (run-topdown) "./run-topdown.scm"
%use (run-topdown-loop) "./run-topdown-loop.scm"
%use (run-topdown-ordered) "./run-topdown-ordered.scm"
%use (reduce-hook) "./reduce-hook.scm"

(use-modules (ice-9 pretty-print))

(display "Not implemented\n" (current-error-port))
(exit 1)
