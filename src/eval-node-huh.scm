
%run guile

%var eval-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"

(define (eval-node? n)
  (equal? 'eval (reference-type (node/directed-label n))))
