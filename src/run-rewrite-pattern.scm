
%run guile

%var run-rewrite-pattern

%use (make-node set-node-children! node-children) "./node.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (make-fresh-branch-node) "./make-fresh-branch-node.scm"

(define (run-rewrite-pattern input-node replace-pattern0)
  (define (loop P)
    (if (free-variable? P)
        (if (free-variable-associated? P)
            (free-variable-get-association P)
            (make-fresh-branch-node
             (map loop (node-children P))))
        P))

  (define new-children
    (map loop (node-children replace-pattern0)))

  (set-node-children! input-node new-children))
