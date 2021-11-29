
%run guile

%var run-environment

%use (run-rewrite-block) "./run-rewrite-block.scm"

(define (run-environment env main-input)
  (cond
   ((equal? keyword-or env)
  (run-rewrite-block env main-input))
