
%run guile

%var free-variable?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-meta) "./reference.scm"

(define (free-variable? node)
  (define ref (node/directed-label node))
  (define meta (reference-meta ref))
  (and (pair? meta) (eq? 'free-var (car meta))))
