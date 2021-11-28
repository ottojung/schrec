
%run guile

%var let-node?

%use (node-label) "./node.scm"
%use (reference-type) "./reference.scm"

(define (let-node? n)
  (equal? 'tlet (reference-type (node-label n))))
