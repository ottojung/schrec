
%run guile

%var check-environment

%use (or-expression?) "./or-expression-huh.scm"
%use (and-expression?) "./and-expression-huh.scm"
%use (check-rewrite-block) "./check-rewrite-block.scm"

;; returns #f or success
(define (check-environment env)
  (let loop ((env env))
    (cond
     ((or-expression? env) #f)
     ((and-expression? env) #f)
     (else (check-rewrite-block env)))))
