
%run guile

%var get-let-bindings

%use (raisu) "./euphrates/raisu.scm"

(define (get-let-bindings let-list)
  (if (null? let-list)
      (raisu 'not-a-let-list let-list)
      (if (null? (cdr let-list))
          (raisu 'let-does-not-have-bindings let-list)
          (cadr let-list))))
