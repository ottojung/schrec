
%run guile

%var initialize-free-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"

;; returns #t on success, #f on failure
(define (initialize-free-variable! free-node)
  (define meta (node-meta free-node))

  (if meta (raisu 'unexpected-initialized-free-variable! free-node)
      (begin
        (set-node-meta! free-node (cons 'free-var #f))
        #t)))
