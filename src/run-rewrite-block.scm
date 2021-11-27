
%run guile

%var run-rewrite-block

%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block) "./match-rewrite-block.scm"
%use (rewrite-rewrite-block) "./rewrite-rewrite-block.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"

%use (debug) "./euphrates/debug.scm"

(define (run-rewrite-block block main-input)
  (initialize-rewrite-block block)
  (define ok? (match-rewrite-block block main-input))
  (debug "OK: ~s" ok?)

  (when ok? (rewrite-rewrite-block block))

  (debug "REWRITTEN")

  (uninitialize-rewrite-block block)

  (debug "UNINITED")

  ok?)
