
%run guile

%use (range) "./src/euphrates/range.scm"
%use (comp) "./src/euphrates/comp.scm"
%use (assert=) "./src/euphrates/assert-equal.scm"
%use (node? node-children set-node-children! node-label) "./src/node.scm"
%use (list->graph) "./src/list-to-graph.scm"
%use (graph->list) "./src/graph-to-list.scm"
%use (run-environment) "./src/run-environment.scm"
%use (reduce-topdown) "./src/reduce-topdown.scm"
%use (run-topdown) "./src/run-topdown.scm"
%use (run-topdown-loop) "./src/run-topdown-loop.scm"
%use (run-topdown-ordered) "./src/run-topdown-ordered.scm"
%use (run-topdown-correct) "./src/run-topdown-correct.scm"
%use (reduce-hook) "./src/reduce-hook.scm"
%use (get-head) "./src/get-head.scm"
%use (find-partially-sorted-evals) "./src/find-partially-sorted-evals.scm"

%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"

(use-modules (ice-9 pretty-print))

;; test eval ordering
(let ()
  (define instance
    '(a b c
        (x x (do e1 b1))
        (y y (do e6 (do e7 b7)))
        (do e2
            (d e (do e3
                     (f g
                        (k l (do e4 (i o)))))
               (p x (y n (do e5 z)))))))
  (define graph
    (list->graph instance))

  (define found
    (find-partially-sorted-evals graph))

  (define mapped
    (let loop ((x found))
      (cond
       ((node? x)
        ;; x)
        (cadr (get-head 2 x)))
        ;; (list->vector (get-head 2 x)))
       ((pair? x) (map loop x))
       (else x))))

  ;; (display "Partially sorted:\n")
  ;; (pretty-print mapped)
  (assert= '((e5 e4 e7 e1) (e3 e6) (e2)) mapped))
