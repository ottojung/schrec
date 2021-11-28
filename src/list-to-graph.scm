
%run guile

%var list->graph

%use (make-node/directed) "./euphrates/node-directed.scm"
%use (lexical-scope-make lexical-scope-ref lexical-scope-set!) "./euphrates/lexical-scope.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (make-fresh-branch-reference) "./make-fresh-branch-reference.scm"
%use (make-fresh-atom-node) "./make-fresh-atom-node.scm"
%use (let-expression?) "./let-expression-huh.scm"
%use (check-let-syntax) "./check-let-syntax.scm"
%use (parse-let-expression) "./parse-let-expression.scm"

(define (list->graph lst)
  (define scope (lexical-scope-make))
  (let loop ((lst lst))
    (if (pair? lst)
        (if (let-expression? lst)
            (begin
              (check-let-syntax lst)
              (parse-let-expression scope loop lst))
            (make-node/directed (make-fresh-branch-reference) (map loop lst)))
        (let ((existing (lexical-scope-ref scope lst #f)))
          (or existing
              (let* ((new (make-fresh-atom-node lst)))
                (lexical-scope-set! scope lst new)
                new))))))
