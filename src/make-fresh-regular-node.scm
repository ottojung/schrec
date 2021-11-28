
%run guile

%var make-fresh-regular-node

%use (make-fresh-node) "./make-fresh-node.scm"

(define (make-fresh-regular-node label children)
  (make-fresh-node label 'regular children))
