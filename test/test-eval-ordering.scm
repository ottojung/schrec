
%run guile

%use (assert=) "./src/euphrates/assert-equal.scm"
%use (comp) "./src/euphrates/comp.scm"
%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"
%use (range) "./src/euphrates/range.scm"
%use (eval-hook) "./src/eval-hook.scm"
%use (find-partially-sorted-eval-likes) "./src/find-partially-sorted-eval-likes.scm"
%use (get-head) "./src/get-head.scm"
%use (graph->list) "./src/graph-to-list.scm"
%use (list->graph) "./src/list-to-graph.scm"
%use (node-children node-label node? set-node-children!) "./src/node.scm"
%use (run-environment-resultsfirst) "./src/run-environment-resultsfirst.scm"

(use-modules (ice-9 pretty-print))

;; test eval ordering
(let ()
  (define instance
    '(a b c
        (x x (eval-type-1 e1 b1))
        (y y (eval-type-2 e6 (eval-type-1 e7 b7)))
        (eval-type-2 e2
            (d e (eval-type-1 e3
                     (f g
                        (k l (eval-type-2 e4 (i o)))))
               (p x (y n (eval-type-2 e5 z)))))))
  (define graph
    (list->graph instance))

  (define found
    (find-partially-sorted-eval-likes
     `(eval-type-1 eval-type-2) graph))

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
