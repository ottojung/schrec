
%run guile

%var let-expression?

%use (get-atom-type) "./get-atom-type.scm"

(define (let-expression? lst)
  (if (pair? lst)
      (eq? 'tlet (get-atom-type (car lst)))))
