
%run guile

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (find-eval) "./find-eval.scm"

%use (debug) "./euphrates/debug.scm"

(use-modules (ice-9 pretty-print))

(define input
  '(a d b c
      (case (or (_ (_1 + 0) (num _1))
                (_ (_2 + (s _3)) (s (_2 + _3)))
                (_ (num (num _4)) (num _4)))
        ((s 0) + ((s (s 0)) + (s 0))))))

(define graph
  (list->graph input))

(display "Reprinted:\n")
(pretty-print (graph->list graph))

(debug "Eval: ~s" (find-eval graph))

