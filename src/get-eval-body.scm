
%run guile

%var get-eval-body

%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"

(define (get-eval-body graph)
  (define children (node-children graph))
  (if (null? children)
      (raisu 'no-children-in-eval graph)
      (if (null? (cdr children))
          (raisu 'no-env-in-eval graph)
          (if (null? (cdr (cdr children)))
              (raisu 'no-body-in-eval graph)
              (caddr children)))))
