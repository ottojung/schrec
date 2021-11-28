
%run guile

%var find-eval

%use (node-id node-children node-visited? set-node-visited?!) "./node.scm"
%use (eval-node?) "./eval-node-huh.scm"

;; returns either the eval node, or #f
;; FIXME: abort if graph loops into itself!
(define (find-eval graph)
  (let loop ((parent #f) (graph graph))
    (if (node-visited? graph) #f
        (begin
          (set-node-visited?! graph #t)
          (let ((ret
                 (if (eval-node? graph) parent
                     (let cloop ((cs (node-children graph)))
                       (if (null? cs) #f
                           (or (loop graph (car cs))
                               (cloop (cdr cs))))))))
            (set-node-visited?! graph #f)
            ret)))))
