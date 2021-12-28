
%run guile

%var associated-free-variable?

%use (node-meta) "./node.scm"

(define (associated-free-variable? node)
  (define meta (node-meta node))
  (and (pair? meta)
       (equal? 'free-var (car meta))
       (cdr meta)))
