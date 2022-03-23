
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
%use (run-nondet) "./src/run-nondet.scm"

%use (debug) "./src/euphrates/debug.scm"
%use (debugv) "./src/euphrates/debugv.scm"

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

;; (define input
;;   '(a d b c
;;       (let ((addition
;;              (or (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (x + m))
;;                        (r (x + y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (s m))
;;                        (r (s y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x + 0))
;;                        (r (num x)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;                        (fv (g x y z w p))
;;                        (y (s z))
;;                        (w (x + z))
;;                        (p (x + y))
;;                        (r (s w)))
;;                    (fv g p r))))
;;             (multiplication
;;              (or (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (x * m))
;;                        (r (x * y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x * 0))
;;                        (r (num 0)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x * 1))
;;                        (r (num x)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;                        (fv (g x y z w p))
;;                        (y (s z))
;;                        (w (x * z))
;;                        (p (x * y))
;;                        (r (x + w)))
;;                    (fv g p r)))))
;;         (do (or addition multiplication)
;;             ((s (s (s 0))) * ((s 0) + ((s (s 0)) + (s 0))))))))

;; (define input
;;   '(a d b c
;;       (do (let ((g ()) (a ()) (b ()) (fv (g a p b))
;;                 (p (a - b))
;;                 (r (a + b)))
;;             (fv g p r))
;;           ((s (s (s 0))) * ((s 0) - ((s (s 0)) - (s 0)))))))

;; (define input
;;   '(a d b c
;;       (let ((addition
;;              (or (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (x + m))
;;                        (r (x + y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (s m))
;;                        (r (s y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x + 0))
;;                        (r (num x)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;                        (fv (g x y z w p))
;;                        (y (s z))
;;                        (w (x + z))
;;                        (p (x + y))
;;                        (r (s w)))
;;                    (fv g p r))))
;;             (multiplication
;;              (or (let ((g ()) (x ()) (y ()) (m ())
;;                        (fv (g x y m p))
;;                        (m (num y))
;;                        (p (x * m))
;;                        (r (x * y)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x * 0))
;;                        (r (num 0)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ())
;;                        (fv (g x p))
;;                        (p (x * 1))
;;                        (r (num x)))
;;                    (fv g p r))
;;                  (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;                        (fv (g x y z w p))
;;                        (y (s z))
;;                        (w (x * z))
;;                        (p (x * y))
;;                        (r (x + w)))
;;                    (fv g p r)))))
;;         (do (or addition multiplication)
;;             (do (let ((g ()) (a ()) (b ()) (fv (g a p b))
;;                       (p (a - b))
;;                       (r (a + b)))
;;                   (fv g p r))
;;                 ((s (s (s 0))) * ((s 0) - ((s (s 0)) - (s 0)))))))))

;; (define input
;;   '(a d b c
;;       ;; (do (or (let ((g ()) (x ()) (y ()) (m ())
;;       ;;               (fv (g x y m p))
;;       ;;               (m (num y))
;;       ;;               (p (x + m))
;;       ;;               (r (x + y)))
;;       ;;           (fv g p r))
;;       ;;         (let ((g ()) (x ()) (y ()) (m ())
;;       ;;               (fv (g x y m p))
;;       ;;               (m (num y))
;;       ;;               (p (s m))
;;       ;;               (r (s y)))
;;       ;;           (fv g p r))
;;       ;;         (let ((g ()) (x ())
;;       ;;               (fv (g x p))
;;       ;;               (p (x + 0))
;;       ;;               (r (num x)))
;;       ;;           (fv g p r))
;;       ;;         (let ((g ()) (x ()) (y ()) (z ()) (w ())
;;       ;;               (fv (g x y z w p))
;;       ;;               (y (s z))
;;       ;;               (w (x + z))
;;       ;;               (p (x + y))
;;       ;;               (r (s w)))
;;       ;;           (fv g p r)))
;;       (do (or
;;            (let (g x y)
;;              ((+ num) g
;;               (x + (num y))
;;               (x + y)))
;;            (let (g x)
;;              ((s num) g
;;               (s (num x))
;;               (s x)))
;;            (let (g x y)
;;              ((+ s num) g
;;               (x + (s y))
;;               (s (x + y))))
;;            (let (g x)
;;              ((+ 0 num) g
;;               (x + 0)
;;               (num x))))
;;           ((s (s (s 0))) + ((s 0) + ((s (s 0)) + (s 0)))))))

;; (define input
;;   '(a d
;;       (let (g x y)
;;         (do (((+ -) g
;;               (x + y)
;;               (- x y)))
;;             (1 + (2 + 3))))))

;; (define input
;;   '(let (g x y)
;;      (do (((+ -) g
;;            (x + y)
;;            (- x y)))
;;          (1 + (2 + 3)))))

;; (define input
;;   '(do ((let (g x y)
;;           ((+ -) g
;;            (x + y)
;;            (- x y))))
;;        (1 + (2 + 3))))

;; (define input
;;   '(do ((let (g x y)
;;           ((+ -) g
;;            (x + y)
;;            (- x y))))
;;        (1 + (2 + 3))))

;; (define input
;;   '(let ((body
;;           ((s (s 0)) + (s (0 + (s ((s 0) + 0)))))))
;;      (fork
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             ((s x) + 0) ;; match pattern
;;             (s x)))     ;; replace pattern
;;           body)
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             ((0 + 0) + x) ;; match pattern
;;             (0 + x)))     ;; replace pattern
;;           body)
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             (x + (0 + 0)) ;; match pattern
;;             (x + 0)))     ;; replace pattern
;;           body)
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             (s (0 + 0)) ;; match pattern
;;             (s 0)))     ;; replace pattern
;;           body)
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             (0 + (s x)) ;; match pattern
;;             (s x)))     ;; replace pattern
;;           body)
;;       (do (((+ s 0)     ;; constants
;;             g           ;; input
;;             (x + (s y)) ;; match pattern
;;             (s (x + y))))     ;; replace pattern
;;           body))))

;; const input test 1
(define input
  '(let ((switch (off)))
     (do ((() g
           (x)
           (x (x)))
          ((switch off on) switch
           (off)
           (on)))
         (body))))

(define graph
  (list->graph input))

(reduce-hook (lambda (g) (display "\nStep:\n") (pretty-print (graph->list graph))))
(display "\nHead:\n")
(pretty-print (get-head 5 graph))
(display "\nOriginal:\n")
(pretty-print (graph->list graph))
(display "\nLook at me go!\n")
;; (run-topdown-ordered graph)
;; (run-topdown-correct graph)
(run-nondet graph)
