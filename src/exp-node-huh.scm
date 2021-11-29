
%run guile

%var exp-node?

%use (node? node-type) "./node.scm"
%use (exp-node-type) "./exp-node-type.scm"

(define (exp-node? node)
  (and (node? node)
       (equal? exp-node-type (node-type node))))
