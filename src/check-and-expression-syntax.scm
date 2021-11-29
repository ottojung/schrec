
%run guile

%var check-and-expression-syntax

%use (list-length=<?) "./euphrates/list-length-geq-q.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"
%use (and-node?) "./and-node-huh.scm"

(define (check-and-expression-syntax node)
  (define children (node-children node))
  (unless (and (list-length=<? 3 children)
               (and-node? (car children)))
    (raisu 'and-has-bad-syntax node)))
