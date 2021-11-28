
%run guile

%var reduce-topdown

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (run-environment) "./run-environment.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"

(define (reduce-topdown env g)
  (let loop ((g g))
    (if (node-visited? g) #f
        (begin
          (set-node-visited?! g #t)
          (let ((ret (or (run-environment env g)
                         (list-or-map loop (node-children g)))))
            (set-node-visited?! g #f)
            ret)))))
