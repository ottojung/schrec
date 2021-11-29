
%run guile

%var let-expression?

%use (keyword-let) "./keyword-let.scm"

(define (let-expression? lst)
  (if (pair? lst)
      (eq? keyword-let (car lst))))
