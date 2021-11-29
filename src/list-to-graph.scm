
%run guile

%var list->graph

%use (make-node) "./node.scm"
%use (lexical-scope-make lexical-scope-ref lexical-scope-set! lexical-scope-namespace) "./euphrates/lexical-scope.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"
%use (make-fresh-atom-node) "./make-fresh-atom-node.scm"
%use (let-expression?) "./let-expression-huh.scm"
%use (check-let-syntax) "./check-let-syntax.scm"
%use (parse-let-expression) "./parse-let-expression.scm"
%use (make-root-namespace) "./make-root-namespace.scm"

(define (list->graph lst)
  (define root-namespace (make-root-namespace))
  (define scope (lexical-scope-make (make-root-namespace)))
  (let loop ((lst lst))
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (parse-let-expression scope loop lst))
            (make-fresh-branch-node (map loop lst)))
        (let ((existing (lexical-scope-ref scope lst #f)))
          (or existing
              (let* ((new (make-fresh-atom-node (cons lst root-namespace))))
                (lexical-scope-set! scope root-namespace lst new)
                new))))))
