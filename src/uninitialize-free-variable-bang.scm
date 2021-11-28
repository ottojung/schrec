
%run guile

%var uninitialize-free-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (uninitialize-free-variable! free-node)
  (unless (free-variable? free-node)
    (raisu 'trying-to-deinitialize-variable-that-is-not-free free-node))

  (set-node-meta! free-node #f))
