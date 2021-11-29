
%run guile

%var or-node?

%use (keyword-or) "./keyword-or.scm"
%use (node-label) "./node.scm"
%use (root-namespace) "./root-namespace.scm"

(define (or-node? node)
  (define head (node-label node))
  (and (equal? root-namespace (cdr head))
       (equal? keyword-or (car head))))
