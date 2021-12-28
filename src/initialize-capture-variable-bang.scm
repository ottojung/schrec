
%run guile

%var initialize-capture-variable!

%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"

(define (initialize-capture-variable! node)
  (define meta (node-meta node))

  (if meta (raisu 'unexpected-initialized-capture-variable! node)
      (begin
        (set-node-meta! node 'capture-var)
        #t)))
