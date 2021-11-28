
%run guile

%var eval-node?

%use (node-label) "./node.scm"
%use (reference-type) "./reference.scm"

(define (eval-node? n)
  (equal? 'teval (reference-type (node-label n))))
