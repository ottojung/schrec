
%run guile

%var make-fresh-atom-node

%use (make-fresh-node) "./make-fresh-node.scm"
%use (get-atom-type) "./get-atom-type.scm"

(define (make-fresh-atom-node atom)
  (make-fresh-node atom (get-atom-type atom) '()))
