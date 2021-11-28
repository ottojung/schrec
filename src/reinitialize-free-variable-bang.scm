
%run guile

%var reinitialize-free-variable!

%use (node-children set-node-children! node-label set-node-label!) "./node.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-meta) "./reference.scm"
%use (reference-set-meta) "./reference-set-meta.scm"
%use (free-variable?) "./free-variable-huh.scm"

;; returns #t on success, #f on failure
(define (reinitialize-free-variable! free-node)
  (define ref (node-label free-node))
  (define meta (reference-meta ref))

  (cond
   ((free-variable? free-node) #t)
   (meta (raisu 'unexpected-initialized-free-variable! free-node))
   (else
    (let* ((new-reference (reference-set-meta ref (cons 'free-var #f))))
      (set-node-label! free-node new-reference)
      #t))))
