
%run guile

%var let-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"

(define (let-node? n)
  (equal? 'let (car (node/directed-label n))))
