
%run guile

%var make-fresh-branch-node

%use (make-fresh-node) "./make-fresh-node.scm"
%use (root-namespace) "./root-namespace.scm"

(define (make-fresh-branch-node children)
  (make-fresh-node (cons '.EXP root-namespace) 'exp children))
