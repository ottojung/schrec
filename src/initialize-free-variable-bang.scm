
%run guile

%var initialize-free-variable!

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-meta) "./reference.scm"
%use (reference-set-meta) "./reference-set-meta.scm"

;; returns #t on success, #f on failure
(define (initialize-free-variable! free-node)
  (define ref (node/directed-label free-node))
  (define meta (reference-meta ref))

  (if meta (raisu 'unexpected-initialized-free-variable! free-node)
      (let* ((new-reference (reference-set-meta ref (cons 'free-var #f))))
        (set-node/directed-label! free-node new-reference)
        #t)))
