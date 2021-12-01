
%run guile

%var run-topdown-loop

%use (reduce-topdown) "./reduce-topdown.scm"
%use (find-bottommost-eval) "./find-bottommost-eval.scm"
%use (node-children) "./node.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"

;; NOTE: not semantically correct
(define (run-topdown-loop g)
  (let ((eval-node (find-bottommost-eval g)))
    (and eval-node
         (let ((env (get-eval-env eval-node)) ;; TODO(eval-syntax): check syntax
               (body (get-eval-body eval-node)))
           (let loop ((evaled? #f))
             (if (reduce-topdown env body)
                 (loop #t)
                 evaled?))))))
