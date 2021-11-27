
%run guile

%var find-eval

%use (make-hashset hashset-ref hashset-add!) "./euphrates/ihashset.scm"
%use (node/directed-children) "./euphrates/node-directed-obj.scm"
%use (eval-node?) "./eval-node-huh.scm"
%use (node-id) "./node-id.scm"

;; returns either the eval node, or #f
(define (find-eval graph)
  (define H (make-hashset))
  (let loop ((parent #f) (graph graph))
    (if (hashset-ref H (node-id graph)) #f ;; already visited
        (begin
          (hashset-add! H (node-id graph))
          (if (eval-node? graph) parent
              (let cloop ((cs (node/directed-children graph)))
                (if (null? cs) #f
                    (or (loop graph (car cs))
                        (cloop (cdr cs))))))))))
