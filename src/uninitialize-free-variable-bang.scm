
%run guile

%var uninitialize-free-variable!

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-meta) "./reference.scm"
%use (reference-set-meta) "./reference-set-meta.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (uninitialize-free-variable! free-node)
  (unless (free-variable? free-node)
    (raisu 'trying-to-deinitialize-variable-that-is-not-free free-node))

  (let* ((ref (node/directed-label free-node))
         (new-reference (reference-set-meta ref #f)))
    (set-node/directed-label! free-node new-reference)
    #t))
