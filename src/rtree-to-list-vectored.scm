
%run guile

%var rtree->list/vectored

%use (rtree rtree-ref set-rtree-ref! rtree-leaf? rtree-value) "./euphrates/rtree.scm"

(define (rtree->list/vectored tree)
  (let loop ((tree tree))
    (if (vector? tree)
        (vector (rtree-ref (vector-ref tree 0)))
        (let ((recur (map loop (rtree-children tree))))
          (if (rtree-ref tree)
              (vector (rtree-ref tree) recur)
              (if (null? recur)
                  (reference-label (rtree-value tree))
                  recur))))))
