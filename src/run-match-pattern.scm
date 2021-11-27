
%run guile

%var run-match-pattern

%use (node/directed-children) "./euphrates/node-directed-obj.scm"
%use (list-and-map) "./euphrates/list-and-map.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (node-equal?) "./node-equal-huh.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"

%use (debug) "./euphrates/debug.scm"

(define (run-match-pattern match-node input-node)
  (let loop ((match-node match-node) (input-node input-node))
    (when (and (free-variable? input-node)
               (not (free-variable-associated? input-node)))
      (raisu 'unexpected-uninitialized-input-node! input-node))

    (let ((input-val (if (free-variable? input-node)
                         (free-variable-get-association input-node)
                         input-node)))
      (if (free-variable? match-node)
          (if (free-variable-associated? match-node)
              (let ((match-val (free-variable-get-association match-node)))
                (node-equal? match-val input-val))

              (let ((mchildren (node/directed-children match-node))
                    (ichildren (node/directed-children input-val)))
                (associate-free-variable! match-node input-val)
                (or (null? mchildren) ;; NOTE: because of this, we don't have a check for a node that has zero children.
                    (list-and-map loop mchildren ichildren))))

          (node-equal? match-node input-val)))))
