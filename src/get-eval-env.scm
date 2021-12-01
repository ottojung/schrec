
%run guile

%var get-eval-env

%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"

(define (get-eval-env graph)
  (define children (node-children graph))
  (if (null? children)
      (raisu 'no-children-in-eval graph)
      (if (null? (cdr children))
          (raisu 'no-env-in-eval graph)
          (cadr children))))
