
%run guile

%var reinitialize-free-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (reinitialize-free-variable! free-node)
  (define meta (node-meta free-node))

  (cond
   ((free-variable? free-node) #t)
   (meta (raisu 'unexpected-initialized-free-variable! free-node))
   (else
    (set-node-meta! free-node (cons 'free-var #f))
    #t)))
