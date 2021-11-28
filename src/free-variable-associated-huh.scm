
%run guile

%var free-variable-associated?

%use (node-label) "./node.scm"
%use (reference-meta) "./reference.scm"

(define (free-variable-associated? node)
  (not (not (cdr (reference-meta (node-label node))))))
