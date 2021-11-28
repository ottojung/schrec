
%run guile

%var free-variable-get-association

%use (node-label) "./node.scm"
%use (reference-meta) "./reference.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (raisu) "./euphrates/raisu.scm"

(define (free-variable-get-association node)
  (unless (free-variable-associated? node)
    (raisu 'unassociated-free-variable node))
  (cdr (reference-meta (node-label node))))
