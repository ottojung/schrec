
%run guile

%var free-variable-associated?

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-meta) "./reference.scm"

(define (free-variable-associated? node)
  (not (not (cdr (reference-meta (node/directed-label node))))))
