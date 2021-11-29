
%run guile

%var make-fresh-branch-node

%use (make-fresh-node) "./make-fresh-node.scm"
%use (make-root-namespace) "./make-root-namespace.scm"

(define (make-fresh-branch-node children)
  (make-fresh-node (cons '.EXP (make-root-namespace)) 'exp children))
