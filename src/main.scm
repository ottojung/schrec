
%run guile

%use (node-children set-node-children! node-label) "./node.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (find-eval) "./find-eval.scm"
%use (run-environment) "./run-environment.scm"
%use (reduce-topdown) "./reduce-topdown.scm"
%use (run-topdown) "./run-topdown.scm"
%use (run-topdown-loop) "./run-topdown-loop.scm"

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

;; ;; NOTE: rewrites itself if applied to the root LOL :)
;; (define input
;;   '(a b fv
;;       (let ((fv (g x)) (k (l rec z)) (rec (z k)) (l 4) (z l))
;;         (case (fv g (s x) (n x))
;;           (m (s (rec fv a z)))))))

;; NOTE: rewrites itself if applied to the root LOL :)
(define input
  '(a b fv
      (let ((fv (g x)) (k (l rec z)) (rec (z k)) (l 4) (z l))
        (case (or (fv g (s x) (n x))
                  (fv g (m x) (n x)))
          (m (s (rec fv a z)))))))

(define graph
  (list->graph input))

(display "\nReprinted:\n")
(pretty-print (graph->list graph))

(debug "\nrun-topdown: ~s" (run-topdown graph))

(display "\nReprinted2:\n")
(pretty-print (graph->list graph))

(debug "\nrun-topdown: ~s" (run-topdown graph))

(display "\nReprinted3:\n")
(pretty-print (graph->list graph))

;; (define eval-node
;;   (find-eval graph))

;; (display "\nEval:\n")
;; (pretty-print (graph->list eval-node))

;; (define env0
;;   (cadr (node-children eval-node)))

;; (define body0
;;   (caddr (node-children eval-node)))

;; (define match-result
;;   (run-environment env0 body0))

;; (debug "\nmatch-result: ~s" match-result)

;; (display "\nReprinted2:\n")
;; (pretty-print (graph->list graph))

;; (debug "\nenv0: ~s" (graph->list env0))

;; (debug "match-result2: " (reduce-topdown env0 body0))
;; (display "\nReprinted3:\n")
;; (pretty-print (graph->list graph))



