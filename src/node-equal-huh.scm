
%run guile

%var node-equal?

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (reference-id) "./reference.scm"

(define (node-equal? a b)
  (eq? (reference-id (node/directed-label a))
       (reference-id (node/directed-label b))))
