
%run guile

%var run-environment

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (run-rewrite-block) "./run-rewrite-block.scm"
%use (or-expression?) "./or-expression-huh.scm"
%use (and-expression?) "./and-expression-huh.scm"
%use (check-or-expression-syntax) "./check-or-expression-syntax.scm"
%use (check-and-expression-syntax) "./check-and-expression-syntax.scm"
%use (node-children) "./node.scm"
%use (initialize-rewrite-block) "./initialize-rewrite-block.scm"
%use (match-rewrite-block) "./match-rewrite-block.scm"
%use (rewrite-rewrite-block) "./rewrite-rewrite-block.scm"
%use (uninitialize-rewrite-block) "./uninitialize-rewrite-block.scm"

(define (run-environment env main-input)
  (define (expr-map fn)
    (let loop ((env env))
      (cond
       ((or-expression? env)
        (check-or-expression-syntax env)
        (list-or-map loop (cdr (node-children env))))
       ((and-expression? env)
        (check-and-expression-syntax env)
        (list-and-map loop (cdr (node-children env))))
       (else
        (fn env main-input)))))

  (define (expr-for-each fn)
    (let loop ((env env))
      (cond
       ((or-expression? env)
        (check-or-expression-syntax env)
        (for-each loop (cdr (node-children env))))
       ((and-expression? env)
        (check-and-expression-syntax env)
        (for-each loop (cdr (node-children env))))
       (else
        (fn env main-input)))))

  (define run-result
    (and (expr-for-each initialize-rewrite-block)
         (expr-map match-rewrite-block)
         (expr-for-each rewrite-rewrite-block)))

  (and (expr-for-each uninitialize-rewrite-block)
       run-result))
