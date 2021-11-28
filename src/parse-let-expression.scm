
%run guile

%var parse-let-expression

%use (node/directed-children set-node/directed-children! node/directed-label) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (lexical-scope-ref lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!) "./euphrates/lexical-scope.scm"
%use (fn-cons) "./euphrates/fn-cons.scm"
%use (fp) "./euphrates/fp.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (make-fresh-branch-reference) "./make-fresh-branch-reference.scm"
%use (make-fresh-atom-node) "./make-fresh-atom-node.scm"
%use (let-expression?) "./let-expression-huh.scm"
%use (check-let-syntax) "./check-let-syntax.scm"
%use (reference-label) "./reference.scm"

(define (parse-let-expression scope loop lst)
  (define let-bindings (cadr lst))
  (define let-body (caddr lst))

  ;; TODO(let-aliasing): support let aliases, like `(let ((x 3)) ...)`
  (define binding-nodes
    (map (fn-cons make-fresh-atom-node identity) let-bindings))

  (lexical-scope-stage! scope)

  (for-each
   (fp (binding-node value)
       (lexical-scope-set!
        scope (reference-label (node/directed-label binding-node))
        binding-node))
   binding-nodes)

  (for-each
   (fp (binding-node value)
       (if (pair? value)
           (set-node/directed-children! binding-node (map loop value))
           (lexical-scope-set!
            scope (reference-label (node/directed-label binding-node))
            (loop value))))
   binding-nodes)

  (let ((result (loop let-body)))
    (lexical-scope-unstage! scope)
    result))
