
%run guile

%var get-let-body

%use (raisu) "./euphrates/raisu.scm"

(define (get-let-body let-list)
  (if (null? let-list)
      (raisu 'not-a-let-list let-list)
      (if (null? (cdr let-list))
          (raisu 'let-does-not-have-bindings let-list)
          (if (null? (cddr let-list))
              (raisu 'let-does-not-have-a-body let-list)
              (caddr let-list)))))
