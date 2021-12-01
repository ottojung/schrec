
%run guile

%var check-rewrite-block

%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"

(define (check-rewrite-block block)
  (define children (node-children block))
  (unless (= 4 (length children))
    (raisu 'rewrite-block-has-bad-arity block))

  #t)
