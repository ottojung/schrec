
%run guile

%var and-node?

%use (keyword-and) "./keyword-and.scm"
%use (node-label) "./node.scm"
%use (root-namespace) "./root-namespace.scm"

(define (and-node? node)
  (define head (node-label node))
  (and (equal? root-namespace (cdr head))
       (equal? keyword-and (car head))))
