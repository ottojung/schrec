
%run guile

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"

%use (debug) "./euphrates/debug.scm"

(define input
  '(a d b c
      (case (or (_ (_1 + 0) (num _1))
                (_ (0 + _2) (num _2))
                (_ ((s _3) + (s _4)) (s (s (_3 + _4)))))
        ((s 0) + ((s (s 0)) + (s 0))))))

(define graph
  (list->graph input))

(debug "KEK: ~s" graph)

(debug "LOL: ~s" (graph->list graph))

(display "Hello\n")

