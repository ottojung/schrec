
%run guile

%var graph->rtree

%use (node-children node-id set-node-children! node-label) "./node.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (rtree rtree-ref set-rtree-ref! rtree-value rtree-children set-rtree-children!) "./euphrates/rtree.scm"

(define (graph->rtree g)
  (define H (make-hashmap))
  (define counter 0)
  (let loop ((g g))
    (let ((get (hashmap-ref H (node-id g) #f)))
      (if get
          (begin
            (unless (rtree-ref get)
              (set! counter (+ 1 counter))
              (set-rtree-ref! get counter))
            (vector get))
          (let* ((B (rtree #f g #f)))
            (hashmap-set! H (node-id g) B)
            (set-rtree-children! B (map loop (node-children g)))
            B)))))
