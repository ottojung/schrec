
%run guile

%use (range) "./src/euphrates/range.scm"
%use (comp) "./src/euphrates/comp.scm"
%use (assert=) "./src/euphrates/assert-equal.scm"
%use (node? node-children set-node-children! node-label) "./src/node.scm"
%use (list->graph) "./src/list-to-graph.scm"
%use (graph->list) "./src/graph-to-list.scm"
%use (run-environment) "./src/run-environment.scm"
%use (eval-hook) "./src/eval-hook.scm"
%use (get-head) "./src/get-head.scm"
%use (find-partially-sorted-evals) "./src/find-partially-sorted-evals.scm"

%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"

(use-modules (ice-9 pretty-print))

;; test eval ordering
(let ()
  (define instance
    '(a b c
        (x x (eval e1 b1))
        (y y (eval e6 (eval e7 b7)))
        (eval e2
            (d e (eval e3
                     (f g
                        (k l (eval e4 (i o)))))
               (p x (y n (eval e5 z)))))))
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
