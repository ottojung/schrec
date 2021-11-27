
%run guile

%var wildcard-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-type) "./reference.scm"

(define (wildcard-node? n)
  (equal? 'wildcard (reference-type (node/directed-label n))))
