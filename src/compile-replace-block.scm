
%run guile

%var compile-replace-block

%use (make-node node-children set-node-children! node-label set-node-label!) "./node.scm"
%use (make-fresh-wildcard-reference) "./make-fresh-wildcard-reference.scm"

;; Takes a list `block' and returns the compiled node.
;; `default' is the enclosing list->graph procedure.
(define (compile-replace-block default block)
  (define match-pattern (list-ref block 1))

  (define new-match
    (let loop ((match-pattern match-pattern))
      (if (pair? match-pattern)
          (make-node
           (make-fresh-wildcard-reference)
           (map loop match-pattern))
          (default match-pattern))))

  (cons (default (car block)) (cons new-match (map default (cddr block)))))
