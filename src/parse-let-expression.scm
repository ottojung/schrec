
%run guile

%var parse-let-expression

%use (make-node node-children set-node-children! node-label) "./node.scm"
%use (lexical-scope-ref lexical-scope-set! lexical-scope-stage! lexical-scope-unstage! lexical-scope-namespace) "./euphrates/lexical-scope.scm"
%use (fp) "./euphrates/fp.scm"
%use (make-fresh-regular-node) "./make-fresh-regular-node.scm"
%use (make-fresh-namespace) "./make-fresh-namespace.scm"
%use (get-let-bindings) "./get-let-bindings.scm"
%use (get-let-body) "./get-let-body.scm"

(define (parse-let-expression scope loop lst)
  (define let-bindings (cadr lst))
  (define let-body (caddr lst))
  (define namespace (make-fresh-namespace))

  (define binding-nodes
    (map
     (fp (name value)
         (if (or (null? value) (pair? value))
             (list (make-fresh-regular-node (cons name namespace) '()) value) ;; TODO: maybe branch node?
             (list name value)))
     let-bindings))

  (lexical-scope-stage! scope namespace)

  (for-each
   (fp (name value)
       (if (or (null? value) (pair? value))
           (lexical-scope-set!
            scope (car (node-label name))
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
