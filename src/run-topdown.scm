
%run guile

%var run-topdown

%use (reduce-topdown) "./reduce-topdown.scm"
%use (find-eval) "./find-eval.scm"
%use (node-children) "./node.scm"

;; NOTE: not semantically correct
(define (run-topdown g)
  (let ((eval-node (find-eval g)))
    (and eval-node
         (let ((env (cadr (node-children eval-node))) ;; TODO(eval-syntax): check syntax
               (body (caddr (node-children eval-node))))
           (let loop ((evaled? #f))
             (if (reduce-topdown env body)
                 (loop #t)
                 evaled?))))))
