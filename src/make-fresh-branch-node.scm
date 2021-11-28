
%run guile

%var make-fresh-branch-node

%use (make-fresh-node) "./make-fresh-node.scm"

(define (make-fresh-branch-node children)
  (make-fresh-node '.EXP 'exp children))
