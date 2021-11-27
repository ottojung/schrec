
%run guile

%var run-environment

%use (run-rewrite-block) "./run-rewrite-block.scm"

(define (run-environment env main-input)
  ;; TODO(or-and-rules): implement AND and OR connectives.
  (run-rewrite-block env main-input))
