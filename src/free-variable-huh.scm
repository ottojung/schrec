
%run guile

%var free-variable?

%use (node-label node-meta) "./node.scm"

(define (free-variable? node)
  (define meta (node-meta node))
  (and (pair? meta) (eq? 'free-var (car meta))))
