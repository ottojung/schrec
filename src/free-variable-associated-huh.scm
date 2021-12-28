
%run guile

%var free-variable-associated?

%use (node-label node-meta) "./node.scm"

(define (free-variable-associated? node)
  (define meta (node-meta node))
  (and (pair? meta)
       (not (not (cdr meta)))))
