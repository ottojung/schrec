
%run guile

%var free-variable-get-association

%use (node-label node-meta) "./node.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (raisu) "./euphrates/raisu.scm"

(define (free-variable-get-association node)
  (unless (free-variable-associated? node)
    (raisu 'unassociated-free-variable node))
  (cdr (node-meta node)))
