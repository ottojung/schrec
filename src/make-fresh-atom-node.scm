
%run guile

%var make-fresh-atom-node

%use (make-node) "./node.scm"
%use (make-fresh-atom-reference) "./make-fresh-atom-reference.scm"

(define (make-fresh-atom-node atom)
  (make-node (make-fresh-atom-reference atom) '()))
