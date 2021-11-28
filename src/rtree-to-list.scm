
%run guile

%var rtree->list

%use (node? node-children set-node-children! node-label set-node-label!) "./node.scm"
%use (rtree rtree? rtree-ref set-rtree-ref! rtree-value rtree-children) "./euphrates/rtree.scm"
%use (make-hashmap hashmap-ref hashmap-set! hashmap->alist) "./euphrates/ihashmap.scm"
%use (cons!) "./euphrates/cons-bang.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (fp) "./euphrates/fp.scm"
%use (reference-label reference-id) "./reference.scm"
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

  (define ref->name-map (make-hashmap))
  (define name->ref-map (make-hashmap))

  (define (get-label ref)
    (cdr (hashmap-ref ref->name-map (reference-id ref) 'label-not-found)))

  (for-each
   (lambda (p)
     (define ref (car p))
     (define existing (hashmap-ref name->ref-map (reference-label ref) #f))

     (define name-info
       (if existing
           (unless (eqv? existing (reference-id ref))
             (let* ((name-info (hashmap-ref ref->name-map existing #f))
                    (counter (car name-info))
                    (self-counter (+ 1 counter))
                    (new-name (string->symbol (string-append (symbol->string (reference-label ref)) "." (number->string self-counter)))))
               (cons self-counter new-name)))
           (cons 1 (reference-label ref))))

     (hashmap-set! name->ref-map (cdr name-info) (reference-id ref))
     (hashmap-set! ref->name-map (reference-id ref) name-info))
   all-references)

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            all-references))

  (cons keyword-let (cons (map tuple-to-binding useful-refs) (list (dereference tree)))))
