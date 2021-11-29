
%run guile

%var run-environment

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (run-rewrite-block) "./run-rewrite-block.scm"
%use (or-expression?) "./or-expression-huh.scm"
%use (check-or-expression-syntax) "./check-or-expression-syntax.scm"
%use (node-children) "./node.scm"

(define (run-environment env main-input)
  (let loop ((env env))
    (cond
     ((or-expression? env)
      (check-or-expression-syntax env)
      (list-or-map loop (cdr (node-children env))))
     (else
      (run-rewrite-block env main-input)))))
