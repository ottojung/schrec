
%run guile

%var run-environment

%use (run-rewrite-block) "./run-rewrite-block.scm"
%use (or-expression?) "./or-expression-huh.scm"
%use (node-children) "./node.scm"

(define (run-environment env main-input)
  (let loop ((env env))
    (cond
     ((or-expression? env)
      (let ((children (node-children env)))
        (or (loop (cadr children)) (loop (caddr children)))))
     (else
      (run-rewrite-block env main-input)))))
