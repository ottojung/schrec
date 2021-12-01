
%run guile

%var run-topdown

%use (reduce-topdown) "./reduce-topdown.scm"
%use (find-bottommost-eval) "./find-bottommost-eval.scm"
%use (node-children) "./node.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"

(define (run-topdown g)
  (let ((eval-node (find-bottommost-eval g)))
    (and eval-node
         (let ((env (get-eval-env eval-node)) ;; TODO(eval-syntax): check syntax
               (body (get-eval-body eval-node)))
           (reduce-topdown env body)))))
