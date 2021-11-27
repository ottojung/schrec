
%run guile

%var associate-free-variable!

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-meta) "./reference.scm"
%use (reference-set-meta) "./reference-set-meta.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (associate-free-variable! free-node target-node)
  (define ref (node/directed-label free-node))
  (define meta (reference-meta ref))

  (unless (free-variable? free-node)
    (raisu 'trying-to-associate-variable-that-is-not-free free-node))

  (if (free-variable-associated? free-node)
      (let ((current-target (free-variable-get-association free-node)))
        (node-equal? current-target target-node))
      (let* ((new-reference (reference-set-meta (cons 'free-var target-node))))
        (set-node/directed-label! free-node new-reference)
        #t)))

