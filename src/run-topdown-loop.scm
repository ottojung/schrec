
%run guile

%var run-topdown-loop

%use (reduce-loop) "./reduce-loop.scm"
%use (find-bottommost-eval) "./find-bottommost-eval.scm"

;; NOTE: not semantically correct
(define (run-topdown-loop g)
  (let ((eval-node (find-bottommost-eval g)))
    (and eval-node
         (reduce-loop eval-node))))
