
%run guile

%var run-rewrite-block

%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"

(define (run-rewrite-block block main-input)
  (initialize-rewrite-block block)
  (define ok? (match-rewrite-block block main-input))
  (debug "OK: ~s" ok?)

  ;; something, something, rewrite....

  ok?)
