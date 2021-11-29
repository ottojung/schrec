
%run guile

%var run-match-pattern

%use (node-children) "./node.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"

(define (run-match-pattern match-node input-node)
  (let loop ((match-node match-node) (input-node input-node))
    (let ((input-val (if (and (free-variable? input-node)
                              (free-variable-associated? input-node)) ;; NOTE(input-variable): this check is wierd, I know. It seems that this only happens when we have free variable on the right hand side. The only logical thing to do is to treat it as a regular node.
                         (free-variable-get-association input-node)
                         input-node)))
      (if (free-variable? match-node)
          (if (free-variable-associated? match-node)
              (let ((match-val (free-variable-get-association match-node)))
                (node-equal? match-val input-val))

              (let ((mchildren (node-children match-node))
                    (ichildren (node-children input-val)))
                (associate-free-variable! match-node input-val)
                (or (null? mchildren) ;; NOTE(null-wildcard): because of this, we don't have a check for a node that has zero children.
                    (list-and-map loop mchildren ichildren))))

          (node-equal? match-node input-val)))))
