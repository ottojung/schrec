
%run guile

%var rtree->list

%use (rtree rtree-ref set-rtree-ref! rtree-leaf? rtree-value) "./euphrates/rtree.scm"

(define (rtree->list tree)
  (let loop ((tree tree))
    (if (vector? tree)
        (vector (rtree-ref (vector-ref tree 0)))
        (if (rtree-leaf? tree)
            (if (rtree-ref tree)
                (vector (rtree-ref tree) (rtree-value tree))
                (rtree-value tree))
            (map loop (rtree-value tree))))))
