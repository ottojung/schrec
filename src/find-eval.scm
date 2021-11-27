
%run guile

%var find-eval

%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (node/directed-children) "./euphrates/node-directed-obj.scm"
%use (eval-node?) "./eval-node-huh.scm"

;; returns either the eval node, or #f
(define (find-eval graph)
  (define H (make-hashmap))
  (let loop ((parent #f) (graph graph))
    (if (eval-node? graph) parent
        (let cloop ((cs (node/directed-children graph)))
          (if (null? cs) #f
              (or (loop graph (car cs))
                  (cloop (cdr cs))))))))
