
%run guile

%var run-topdown-ordered

%use (run-environment) "./run-environment.scm"
%use (find-sorted-evals) "./find-sorted-evals.scm"
%use (get-eval-env) "./get-eval-env.scm"
%use (reduce-loop) "./reduce-loop.scm"

%use (debug) "./euphrates/debug.scm"
%use (graph->list) "./graph-to-list.scm"

;; NOTE: not semantically correct either
(define (run-topdown-ordered graph)
  (let oloop ()
    (define evals (find-sorted-evals graph))
    (when (let loop ((evals evals))
            (if (null? evals) #f
                (let ((cur (car evals)))
                  (or (reduce-loop cur)
                      (loop (cdr evals))))))
      (oloop))))
