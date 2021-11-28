
%run guile

%var free-variable-associated?

%use (node-label node-meta) "./node.scm"

(define (free-variable-associated? node)
  (not (not (cdr (node-meta node)))))
