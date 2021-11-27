
%run guile

%var make-fresh-atom-node

%use (make-node/directed) "./euphrates/node-directed.scm"
%use (make-fresh-atom-reference) "./make-fresh-atom-reference.scm"

(define (make-fresh-atom-node atom)
  (make-node/directed (make-fresh-atom-reference atom) '()))
