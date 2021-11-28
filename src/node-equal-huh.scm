
%run guile

%var node-equal?

%use (node-children set-node-children! node-label set-node-label!) "./node.scm"
%use (reference-id) "./reference.scm"

(define (node-equal? a b)
  ;; TODO: can get away with just (eq? a b) ???
  (eqv? (reference-id (node-label a))
        (reference-id (node-label b))))
