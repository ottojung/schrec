
%run guile

%var wildcard-node?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"

(define (wildcard-node? n)
  (equal? 'wildcard (car (node/directed-label n))))
