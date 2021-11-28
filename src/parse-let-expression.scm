
%run guile

%var parse-let-expression

%use (node/directed-children set-node/directed-children! node/directed-label) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (lexical-scope-ref lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!) "./euphrates/lexical-scope.scm"
%use (fn-cons) "./euphrates/fn-cons.scm"
%use (fp) "./euphrates/fp.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (make-fresh-regular-reference) "./make-fresh-regular-reference.scm"
%use (let-expression?) "./let-expression-huh.scm"
%use (check-let-syntax) "./check-let-syntax.scm"
%use (reference-label) "./reference.scm"

(define (parse-let-expression scope loop lst)
  (define let-bindings (cadr lst))
  (define let-body (caddr lst))

  (define binding-nodes
    (map
     (lambda (lst)
       (let* ((name (car lst))
              (value (cadr lst)))
         (if (pair? value)
             (list (make-node/directed (make-fresh-regular-reference name) '()) value)
             (list name value))))
     let-bindings))

  (lexical-scope-stage! scope)

  (for-each
   (fp (name value)
       (if (pair? value)
           (lexical-scope-set!
            scope (reference-label (node/directed-label name))
            name)
           (lexical-scope-set!
            scope name
            (loop value))))
   binding-nodes)

  (for-each
   (fp (binding-node value)
       (when (pair? value)
         (set-node/directed-children! binding-node (map loop value))))
   binding-nodes)

  (let ((result (loop let-body)))
    (lexical-scope-unstage! scope)
    result))
