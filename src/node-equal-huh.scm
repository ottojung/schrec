
%run guile

%var node-equal?

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (reference-id) "./reference.scm"

(define (node-equal? a b)
  ;; TODO: can get away with just (eq? a b) ???
  (eqv? (reference-id (node/directed-label a))
        (reference-id (node/directed-label b))))
