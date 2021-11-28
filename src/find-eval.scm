
%run guile

%var find-eval

%use (make-hashset hashset-ref hashset-add!) "./euphrates/ihashset.scm"
%use (node-id node-children) "./node.scm"
%use (eval-node?) "./eval-node-huh.scm"

;; returns either the eval node, or #f
;; TODO: consider using O(1) memory algorithm like the "turle and hare".
;; FIXME: abort if graph loops into itself!
(define (find-eval graph)
  (define H (make-hashset))
  (let loop ((parent #f) (graph graph))
    (if (hashset-ref H (node-id graph)) #f ;; already visited
        (begin
          (hashset-add! H (node-id graph))
          (if (eval-node? graph) parent
              (let cloop ((cs (node-children graph)))
                (if (null? cs) #f
                    (or (loop graph (car cs))
                        (cloop (cdr cs))))))))))
