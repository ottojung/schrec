
%run guile

%var eval-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-type) "./reference.scm"

(define (eval-node? n)
  (equal? 'teval (reference-type (node/directed-label n))))
