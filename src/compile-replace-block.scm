
%run guile

%var compile-replace-block

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
;; %use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (make-fresh-wildcard-reference) "./make-fresh-wildcard-reference.scm"
;; %use (get-atom-type) "./get-atom-type.scm"

;; Takes a list `block' and returns the compiled node/directed.
;; `default' is the enclosing list->graph procedure.
(define (compile-replace-block default block)
  (define match-pattern (list-ref block 1))

  (define new-match
    (let loop ((match-pattern match-pattern))
      (if (pair? match-pattern)
          (make-node/directed
           (make-fresh-wildcard-reference)
           (map loop match-pattern))
          (default match-pattern))))

  (cons (default (car block)) (cons new-match (map default (cddr block)))))
