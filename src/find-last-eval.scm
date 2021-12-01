
%run guile

%var find-last-eval

%use (node-id node-children node-visited? set-node-visited?!) "./node.scm"
%use (eval-node?) "./eval-node-huh.scm"
%use (get-eval-body) "./get-eval-body.scm"

;; returns either the eval node, or #f
;; FIXME: abort if graph loops into itself!
(define (find-last-eval graph)
  (let loop ((parent #f) (graph graph))
    (if (node-visited? graph) #f
        (begin
          (set-node-visited?! graph #t)
          (let* ((ret1
                  (if (eval-node? graph) parent
                      (let cloop ((cs (node-children graph)))
                        (if (null? cs) #f
                            (or (loop graph (car cs))
                                (cloop (cdr cs)))))))
                 (ret2 (and ret1 (find-last-eval (get-eval-body ret1))))
                 (ret (or ret2 ret1)))
            (set-node-visited?! graph #f)
            ret)))))
