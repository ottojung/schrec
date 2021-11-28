
%run guile

%var parse-let-expression

%use (make-node node-children set-node-children! node-label) "./node.scm"
%use (lexical-scope-ref lexical-scope-set! lexical-scope-stage! lexical-scope-unstage!) "./euphrates/lexical-scope.scm"
%use (fp) "./euphrates/fp.scm"
%use (make-fresh-regular-node) "./make-fresh-regular-node.scm"

(define (parse-let-expression scope loop lst)
  (define let-bindings (cadr lst))
  (define let-body (caddr lst))

  (define binding-nodes
    (map
     (fp (name value)
         (if (or (null? value) (pair? value))
             (list (make-fresh-regular-node name '()) value)
             (list name value)))
     let-bindings))

  (lexical-scope-stage! scope)

  (for-each
   (fp (name value)
       (if (or (null? value) (pair? value))
           (lexical-scope-set!
            scope (node-label name)
            name)
           (lexical-scope-set!
            scope name
            (loop value))))
   binding-nodes)

  (for-each
   (fp (binding-node value)
       (when (pair? value)
         (set-node-children! binding-node (map loop value))))
   binding-nodes)

  (let ((result (loop let-body)))
    (lexical-scope-unstage! scope)
    result))
