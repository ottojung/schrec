
%run guile

%var node-equal?

%use (node-id) "./node.scm"

(define (node-equal? a b)
  ;; TODO: can get away with just (eq? a b) ???
  (= (node-id a)
     (node-id b)))
