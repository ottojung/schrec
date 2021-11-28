
%run guile

%var associate-free-variable!

%use (node-children set-node-children! node-label set-node-label!) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-meta) "./reference.scm"
%use (reference-set-meta) "./reference-set-meta.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-associated?) "./free-variable-associated-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"
%use (node-equal?) "./node-equal-huh.scm"

;; returns #t on success, #f on failure
(define (associate-free-variable! free-node target-node)
  (define ref (node-label free-node))
  (define meta (reference-meta ref))

  (unless (free-variable? free-node)
    (raisu 'trying-to-associate-variable-that-is-not-free free-node))

  (if (free-variable-associated? free-node)
      (let ((current-target (free-variable-get-association free-node)))
        (node-equal? current-target target-node))
      (let* ((new-reference (reference-set-meta ref (cons 'free-var target-node))))
        (set-node-label! free-node new-reference)
        #t)))

