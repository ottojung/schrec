
%run guile

%var uninitialize-capture-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (capture-variable?) "./capture-variable-huh.scm"

;; returns #t on success, #f on failure
(define (uninitialize-capture-variable! node)
  (unless (capture-variable? node)
    (raisu 'trying-to-deinitialize-variable-that-is-not-capture node))

  (set-node-meta! node #f))
