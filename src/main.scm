
%run guile

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (find-eval) "./find-eval.scm"
%use (run-environment) "./run-environment.scm"

%use (debug) "./euphrates/debug.scm"

(use-modules (ice-9 pretty-print))

;; (define input
;;   '(a d b c
;;       (case (or ((g1 x1)    g1 (x1 + 0)       (num x1))
;;                 ((g2 x2 y2) g2 (x2 + (s y2))  (s (x2 + y2)))
;;                 ((g3 x3)    g3 (num (num x3)) (num x3)))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

;; (define input
;;   '(a d b c
;;       (case (or ((g1 x1) g (x1 + 0) (num x1))
;;                 (and ((g2 x2 y2) g2 (x2 + y2) (s (x2 + z2)))
;;                      ((z2)       y2 (s z2)    (s z2)))
;;                 (and ((g3 x3) g3 (num x3) (num z3))
;;                      ((z3)    x3 (num z3) (num z3))))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

;; (define input
;;   '(a b a
;;       (case ((g x) g (s x) (n x))
;;         (s (s 3)))))

(define input
  '(a b a
      (let ((fv (g x)))
        (case (fv g (s x) (n x))
          (s (s 3))))))

(define graph
  (list->graph input))

(display "\nReprinted:\n")
(pretty-print (graph->list graph))

(define eval-node
  (find-eval graph))

(display "\nEval:\n")
(pretty-print (graph->list eval-node))

(define match-result
  (run-environment (cadr (node/directed-children eval-node))
                   (caddr (node/directed-children eval-node))))

(debug "match-result: ~s" match-result)

(display "\nReprinted 2:\n")
(pretty-print (graph->list graph))



