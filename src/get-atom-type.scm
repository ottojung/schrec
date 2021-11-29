
%run guile

%var get-atom-type

%use (keyword-eval) "./keyword-eval.scm"
%use (root-namespace) "./root-namespace.scm"

(define (get-atom-type atom)
  (cond
   ((and (equal? keyword-eval (car atom))
         (equal? root-namespace (cdr atom)))
    'teval)
   (else 'regular)))
