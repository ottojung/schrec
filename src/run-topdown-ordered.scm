
%run guile

%var run-topdown-ordered

%use (list-find-first) "./euphrates/list-find-first.scm"
%use (run-environment) "./run-environment.scm"
%use (find-sorted-evals) "./find-sorted-evals.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (reduce-loop) "./reduce-loop.scm"

;; NOTE: not semantically correct either
(define (run-topdown-ordered graph)
  (let oloop ()
    (define evals (find-sorted-evals graph))
    (when (list-find-first reduce-loop #f evals)
      (oloop))))
