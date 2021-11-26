
%run guile

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"

%use (debug) "./euphrates/debug.scm"

(define input
  '(a d b c
      (let (a c)
        (+ a (b a)))))

(define graph
  (list->graph input))

(debug "KEK: ~s" graph)

(debug "LOL: ~s" (graph->list graph))

(display "Hello\n")

