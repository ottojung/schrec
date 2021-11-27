
%run guile

%var free-variable?

(define (free-variable? node)
  (define ref (node/directed-label node))
  (define meta (reference-meta ref))
  (and (pair? meta) (eq? 'free-var (car meta))))
