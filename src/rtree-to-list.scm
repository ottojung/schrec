
%run guile

%var rtree->list

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (rtree rtree? rtree-ref set-rtree-ref! rtree-value rtree-children) "./euphrates/rtree.scm"
%use (make-hashmap hashmap-set! hashmap->alist) "./euphrates/ihashmap.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (reference-label) "./reference.scm"

(define (rtree->list tree)
  (define H (make-hashmap))

  (define _1
    (let loop ((tree tree))
      (when (rtree? tree)
        (when (rtree-ref tree)
          (hashmap-set! H (rtree-value tree) (rtree-children tree)))
        (for-each loop (rtree-children tree)))))

  (define all-references
    (hashmap->alist H))

  (define (dereference T)
    (let loop ((T T))
      (cond
       ((vector? T)
        (reference-label (rtree-value (vector-ref T 0))))
       ((rtree? T)
        (if (or (rtree-ref T) (null? (rtree-children T)))
            (reference-label (rtree-value T))
            (map loop (rtree-children T))))
       (else (raisu 'Unknown-type-in-dereference T)))))

  (define (tuple-to-binding ref)
    (define key (car ref))
    (define value (cdr ref))
    (list (reference-label key) (map dereference value)))

  (cons 'let (cons (map tuple-to-binding all-references) (list (dereference tree)))))
