
%run guile

%var wildcard-node?

%use (node-label) "./node.scm"
%use (reference-type) "./reference.scm"

(define (wildcard-node? n)
  (equal? 'wildcard (reference-type (node-label n))))
