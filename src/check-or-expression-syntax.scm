
%run guile

%var check-or-expression-syntax

%use (list-length=<?) "./euphrates/list-length-geq-q.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (node-children) "./node.scm"
%use (or-node?) "./or-node-huh.scm"

(define (check-or-expression-syntax node)
  (define children (node-children node))
  (unless (and (list-length=<? 3 children)
               (or-node? (car children)))
    (raisu 'or-has-bad-syntax node)))
