
%run guile

%use (range) "./src/euphrates/range.scm"
%use (comp) "./src/euphrates/comp.scm"
%use (assert=) "./src/euphrates/assert-equal.scm"
%use (node? node-children set-node-children! node-label) "./src/node.scm"
%use (list->graph) "./src/list-to-graph.scm"
%use (graph->list) "./src/graph-to-list.scm"
%use (run-environment) "./src/run-environment.scm"
%use (eval/det-topdown) "./src/eval-det-topdown.scm"
%use (reduce/det-topdown) "./src/reduce-det-topdown.scm"
%use (run-topdown-loop) "./src/run-topdown-loop.scm"
%use (run-topdown-ordered) "./src/run-topdown-ordered.scm"
%use (run-topdown-correct) "./src/run-topdown-correct.scm"
%use (eval-hook) "./src/eval-hook.scm"
%use (get-head) "./src/get-head.scm"
%use (find-partially-sorted-evals) "./src/find-partially-sorted-evals.scm"

%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"

%use () "./example.scm"

(use-modules (ice-9 pretty-print))

(display "Done.\n")
