
%run guile

%var let-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-type) "./reference.scm"

(define (let-node? n)
  (equal? 'tlet (reference-type (node/directed-label n))))
