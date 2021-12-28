
%run guile

%use (range) "./euphrates/range.scm"
%use (node-children set-node-children! node-label) "./node.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (run-environment) "./run-environment.scm"
%use (reduce-topdown) "./reduce-topdown.scm"
%use (run-topdown) "./run-topdown.scm"
%use (run-topdown-loop) "./run-topdown-loop.scm"
%use (run-topdown-ordered) "./run-topdown-ordered.scm"
%use (reduce-hook) "./reduce-hook.scm"

(use-modules (ice-9 pretty-print))

(display "Not implemented\n" (current-error-port))
(exit 1)
