
%run guile

%var reduce-topdown

%use (list-or-map) "./euphrates/list-or-map.scm"
%use (run-environment) "./run-environment.scm"
%use (node-children node-visited? set-node-visited?!) "./node.scm"
%use (check-environment) "./check-environment.scm"
%use (reduce-hook) "./reduce-hook.scm"

(define (reduce-topdown env g)
  (check-environment env)
  (let ((result
         (let loop ((g g))
           (if (node-visited? g) #f
               (begin
                 (set-node-visited?! g #t)
                 (let ((ret (or (run-environment env g)
                                (list-or-map loop (node-children g)))))
                   (set-node-visited?! g #f)
                   ret))))))
    (when (reduce-hook)
      ((reduce-hook) result))
    result))
