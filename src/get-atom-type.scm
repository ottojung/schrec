
%run guile

%var get-atom-type

%use (keyword-eval) "./keyword-eval.scm"
%use (make-root-namespace) "./make-root-namespace.scm"

(define get-atom-type
  (let ((root-namespace (make-root-namespace)))
    (lambda (atom)
      (cond
       ((and (equal? keyword-eval (car atom))
             (equal? root-namespace (cdr atom)))
        'teval)
       (else 'regular)))))
