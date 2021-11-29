
%run guile

%var and-expression?

%use (list-length=<?) "./euphrates/list-length-geq-q.scm"
%use (node-children) "./node.scm"
%use (and-node?) "./and-node-huh.scm"

(define (and-expression? node)
  (define children (node-children node))
  (and-node? (car children)))
