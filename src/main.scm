
%run guile

%use (range) "./euphrates/range.scm"
%use (node-children set-node-children! node-label) "./node.scm"
%use (list->graph) "./list-to-graph.scm"
%use (graph->list) "./graph-to-list.scm"
%use (run-environment) "./run-environment.scm"
%use (reduce-topdown) "./reduce-topdown.scm"
%use (run-topdown) "./run-topdown.scm"
%use (run-topdown-loop) "./run-topdown-loop.scm"

%use (debug) "./euphrates/debug.scm"

(use-modules (ice-9 pretty-print))

;; (define input
;;   '(a d b c
;;       (do (or ((g1 x1)    g1 (x1 + 0)       (num x1))
;;                 ((g2 x2 y2) g2 (x2 + (s y2))  (s (x2 + y2)))
;;                 ((g3 x3)    g3 (num (num x3)) (num x3)))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

;; (define input
;;   '(a d b c
;;       (do (or ((g1 x1) g (x1 + 0) (num x1))
;;                 (and ((g2 x2 y2) g2 (x2 + y2) (s (x2 + z2)))
;;                      ((z2)       y2 (s z2)    (s z2)))
;;                 (and ((g3 x3) g3 (num x3) (num z3))
;;                      ((z3)    x3 (num z3) (num z3))))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

;; (define input
;;   '(a b a
;;       (do ((g x) g (s x) (n x))
;;         (s (s 3)))))

;; ;; NOTE: rewrites itself if applied to the root LOL :)
;; (define input
;;   '(a b fv
;;       (let ((fv (g x)) (k (l rec z)) (rec (z k)) (l 4) (z l))
;;         (do (fv g (s x) (n x))
;;           (m (s (rec fv a z)))))))

;; ;; NOTE: rewrites itself if applied to the root LOL :)
;; (define input
;;   '(a b fv
;;       (let ((fv (g x)) (k (l rec z)) (rec (z k)) (l 4) (z l))
;;         (do (or (fv g (s x) (n x))
;;                   ((h y) h (m y) (n y)))
;;           (m (s (rec fv a z)))))))

;; ;; FIXME: investigate why ".EXP" comes up
;; (define input
;;   '(a d b c
;;       (do (or ((g1 x1) g (x1 + 0) (num x1))
;;                 (and ((g2 x2 y2) g2 (x2 + y2) (s (x2 + z2)))
;;                      ((z2)       y2 (s z2)    (s z2)))
;;                 (and ((g3 x3) g3 (num x3) (num z3))
;;                      ((z3)    x3 (num z3) (num z3))))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

;; (define input
;;   '(a d b c
;;       (do (or (let ((g ()) (x ()) (y ()) (m ())
;;                       (fv (g x y m p))
;;                       (m (num y))
;;                       (p (x + m))
;;                       (r (x + y)))
;;                   (fv g p r))
;;                 (let ((g ()) (x ()) (y ()) (m ())
;;                       (fv (g x y m p))
;;                       (m (num y))
;;                       (p (s m))
;;                       (r (s y)))
;;                   (fv g p r))
;;                 (let ((g ()) (x ())
;;                       (fv (g x p))
;;                       (p (x + 0))
;;                       (r (num x)))
;;                   (fv g p r))
;;                 (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;                       (fv (g x y z w p))
;;                       (y (s z))
;;                       (w (x + z))
;;                       (p (x + y))
;;                       (r (s w)))
;;                   (fv g p r)))
;;         ((s 0) + ((s (s 0)) + (s 0))))))

(define input
  '(a d b c
      (let ((addition
             (or (let ((g ()) (x ()) (y ()) (m ())
                       (fv (g x y m p))
                       (m (num y))
                       (p (x + m))
                       (r (x + y)))
                   (fv g p r))
                 (let ((g ()) (x ()) (y ()) (m ())
                       (fv (g x y m p))
                       (m (num y))
                       (p (s m))
                       (r (s y)))
                   (fv g p r))
                 (let ((g ()) (x ())
                       (fv (g x p))
                       (p (x + 0))
                       (r (num x)))
                   (fv g p r))
                 (let ((g ()) (x ()) (y ()) (z ()) (w ())
                       (fv (g x y z w p))
                       (y (s z))
                       (w (x + z))
                       (p (x + y))
                       (r (s w)))
                   (fv g p r))))
            (multiplication
             (or (let ((g ()) (x ()) (y ()) (m ())
                       (fv (g x y m p))
                       (m (num y))
                       (p (x * m))
                       (r (x * y)))
                   (fv g p r))
                 (let ((g ()) (x ())
                       (fv (g x p))
                       (p (x * 0))
                       (r (num 0)))
                   (fv g p r))
                 (let ((g ()) (x ())
                       (fv (g x p))
                       (p (x * 1))
                       (r (num x)))
                   (fv g p r))
                 (let ((g ()) (x ()) (y ()) (z ()) (w ())
                       (fv (g x y z w p))
                       (y (s z))
                       (w (x * z))
                       (p (x * y))
                       (r (x + w)))
                   (fv g p r)))))
        (do (or addition multiplication)
            ((s (s (s 0))) * ((s 0) + ((s (s 0)) + (s 0))))))))

(define graph
  (list->graph input))

(define (step)
  (debug "\nrun-topdown: ~s" (run-topdown graph))
  (display "Result:\n")
  (pretty-print (graph->list graph)))

(display "\nOriginal:\n")
(pretty-print (graph->list graph))

(for-each (lambda _ (step)) (range 100))
