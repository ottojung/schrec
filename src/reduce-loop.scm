
%run guile

%var reduce-loop

%use (reduce-topdown) "./reduce-topdown.scm"
%use (get-eval-body) "./get-eval-body.scm"
%use (get-eval-env) "./get-eval-env.scm"

(define (reduce-loop eval-node)
  (define env (get-eval-env eval-node)) ;; TODO(eval-syntax): check syntax
  (define body (get-eval-body eval-node))
  (let loop ((evaled? #f))
    (if (reduce-topdown env body)
        (loop #t)
        evaled?)))
