
%run guile

%var or-expression?

%use (node-children) "./node.scm"
%use (or-node?) "./or-node-huh.scm"

(define (or-expression? node)
  (define children (node-children node))
  (and (= 3 (length children))
       (or-node? (car children))))
