
%run guile

%var free-variable?

%use (node-meta) "./node.scm"
%use (capture-variable?) "./capture-variable-huh.scm"

(define (free-variable? node)
  (define meta (node-meta node))
  (not (capture-variable? node)))
