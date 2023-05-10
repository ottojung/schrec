
(cond-expand
 (guile
  (define-module (test-eval-ordering)
    :use-module ((src euphrates assert-equal) :select (assert=))
    :use-module ((src euphrates comp) :select (comp))
    :use-module ((src euphrates debug) :select (debug))
    :use-module ((src euphrates debugv) :select (debugv))
    :use-module ((src euphrates range) :select (range))
    :use-module ((src eval-hook) :select (eval-hook))
    :use-module ((src find-partially-sorted-eval-likes) :select (find-partially-sorted-eval-likes))
    :use-module ((src get-head) :select (get-head))
    :use-module ((src graph-to-list) :select (graph->list))
    :use-module ((src list-to-graph) :select (list->graph))
    :use-module ((src node) :select (node-children node-label node? set-node-children!))
    :use-module ((src run-environment-resultsfirst) :select (run-environment-resultsfirst))
    )))


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
