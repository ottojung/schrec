
%run guile

%var let-node?

%use (node-type) "./node.scm"

(define (let-node? n)
  (equal? 'tlet (node-type n)))
