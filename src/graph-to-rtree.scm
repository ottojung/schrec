
%run guile

%var graph->rtree

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (rtree rtree-ref set-rtree-ref! rtree-leaf? rtree-value) "./euphrates/rtree.scm"
%use (reference reference-id reference-label) "./reference.scm"

(define (graph->rtree g)
  (define H (make-hashmap))
  (define counter 0)
  (let loop ((g g))
    (let ((get (hashmap-ref H (reference-id (node/directed-label g)) #f)))
      (if get
          (begin
            (unless (rtree-ref get)
              (set! counter (+ 1 counter))
              (set-rtree-ref! get counter))
            (vector get))
          (begin
            (let* ((leaf? (null? (node/directed-children g)))
                   (B (rtree #f leaf?
                             (if leaf?
                                 (reference-label (node/directed-label g))
                                 (map loop (node/directed-children g))))))
              (hashmap-set! H (reference-id (node/directed-label g)) B)
              B))))))
