
%run guile

%var free-variable?

%use (node-label) "./node.scm"
%use (reference-meta) "./reference.scm"

(define (free-variable? node)
  (define ref (node-label node))
  (define meta (reference-meta ref))
  (and (pair? meta) (eq? 'free-var (car meta))))
