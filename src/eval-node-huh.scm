
%run guile

%var eval-node?

%use (node-type) "./node.scm"

(define (eval-node? n)
  (equal? 'teval (node-type n)))
