
%run guile

%var capture-variable?

%use (node-meta) "./node.scm"

(define (capture-variable? node)
  (define meta (node-meta node))
  (equal? 'capture-var meta))
