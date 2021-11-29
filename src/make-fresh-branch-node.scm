
%run guile

%var make-fresh-branch-node

%use (make-fresh-node) "./make-fresh-node.scm"
%use (root-namespace) "./root-namespace.scm"
%use (branch-node-label) "./branch-node-label.scm"
%use (exp-node-type) "./exp-node-type.scm"

(define (make-fresh-branch-node children)
  (make-fresh-node (cons branch-node-label root-namespace) exp-node-type children))
