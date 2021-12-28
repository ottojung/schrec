
%run guile

%var free-variable-get-association-or-false

%use (node-label node-meta) "./node.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (raisu) "./euphrates/raisu.scm"

(define (free-variable-get-association-or-false node)
  (and (free-variable-associated? node)
       (cdr (node-meta node))))
