
%run guile

%var or-expression?

%use (list-length=<?) "./euphrates/list-length-geq-q.scm"
%use (node-children) "./node.scm"
%use (or-node?) "./or-node-huh.scm"

(define (or-expression? node)
  (define children (node-children node))
  (or-node? (car children)))
