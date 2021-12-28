
%run guile

%var associate-free-variable!

%use (raisu) "./euphrates/raisu.scm"
%use (stack-push!) "./euphrates/stack.scm"
%use (node-children node-meta set-node-meta! set-node-children! node-label) "./node.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (node-equal?) "./node-equal-huh.scm"

;; returns #t on success, #f on failure
(define (associate-free-variable! free-stack free-node target-node)
  (define meta (node-meta free-node))

  (unless (free-variable? free-node)
    (raisu 'trying-to-associate-variable-that-is-not-free free-node))

  (if (free-variable-associated? free-node)
      (let ((current-target (free-variable-get-association free-node)))
        (node-equal? current-target target-node))
      (begin
        (set-node-meta! free-node (cons 'free-var target-node))
        (stack-push! free-stack free-node)
        #t)))

