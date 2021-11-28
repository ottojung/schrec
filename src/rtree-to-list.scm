
%run guile

%var rtree->list

%use (node? node-id node-children set-node-children! node-label) "./node.scm"
%use (rtree rtree? rtree-ref set-rtree-ref! rtree-value rtree-children) "./euphrates/rtree.scm"
%use (make-hashmap hashmap-ref hashmap-set! hashmap->alist) "./euphrates/ihashmap.scm"
%use (cons!) "./euphrates/cons-bang.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (fp) "./euphrates/fp.scm"
%use (keyword-let) "./keyword-let.scm"

(define (rtree->list tree)
  (define all-references
    (let loop ((tree tree))
      (if (rtree? tree)
          (if (or (rtree-ref tree) (null? (rtree-children tree)))
              (cons
               (cons (rtree-value tree)
                     (cons (rtree-ref tree) (rtree-children tree)))
               (apply append (map loop (rtree-children tree))))
              (apply append (map loop (rtree-children tree))))
          '())))

  (define (dereference T)
    (let loop ((T T))
      (cond
       ((vector? T)
        (get-label (rtree-value (vector-ref T 0))))
       ((rtree? T)
        (if (or (rtree-ref T) (null? (rtree-children T)))
            (get-label (rtree-value T))
            (map loop (rtree-children T))))
       (else (raisu 'Unknown-type-in-dereference T)))))

  (define (tuple-to-binding ref)
    (define key (car ref))
    (define referenced? (cadr ref))
    (define value (cddr ref))
    (list (get-label key) (map dereference value)))

  (define node->name-map (make-hashmap))
  (define name->node-map (make-hashmap))

  (define (get-label node)
    (cdr (hashmap-ref node->name-map (node-id node) 'label-not-found)))

  (for-each
   (lambda (p)
     (define node (car p))
     (define existing (hashmap-ref name->node-map (node-label node) #f))

     (define name-info
       (if existing
           (unless (eqv? existing (node-id node))
             (let* ((name-info (hashmap-ref node->name-map existing #f))
                    (counter (car name-info))
                    (self-counter (+ 1 counter))
                    (new-name (string->symbol (string-append (symbol->string (node-label node)) "." (number->string self-counter)))))
               (cons self-counter new-name)))
           (cons 1 (node-label node))))

     (hashmap-set! name->node-map (cdr name-info) (node-id node))
     (hashmap-set! node->name-map (node-id node) name-info))
   all-references)

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            all-references))

  (cons keyword-let (cons (map tuple-to-binding useful-refs) (list (dereference tree)))))
