
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

(define (run-rewrite-pattern replace-pattern0)
  (let loop ((P replace-pattern0))
    (if (free-variable? P)
        (if (free-variable-associated? P)
            (let ((target (free-variable-get-association P)))
              (unless (null? (node-children P))
                ;; NOTE(null-wildcard): because of this, we don't have a check for a node that has zero children.
                (set-node-children!
                 target
                 (map loop (node-children P))))
              target)
            (make-fresh-branch-node
             (map loop (node-children P))))
        P)))
