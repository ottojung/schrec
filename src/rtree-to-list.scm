
%run guile

%var rtree->list

%use (node? node-id node-children set-node-children! node-label) "./node.scm"
%use (rtree rtree? rtree-ref set-rtree-ref! rtree-value rtree-children) "./euphrates/rtree.scm"
%use (make-hashmap hashmap-ref hashmap-set! hashmap->alist) "./euphrates/ihashmap.scm"
%use (cons!) "./euphrates/cons-bang.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (fp) "./euphrates/fp.scm"
%use (~a) "./euphrates/tilda-a.scm"
%use (keyword-let) "./keyword-let.scm"
%use (exp-node?) "./exp-node-huh.scm"

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
    (hashmap-ref node->name-map (node-id node) 'label-not-found))

  (define counter 0)

  (define _0
    (for-each
     (lambda (p)
       (define node (car p))
       (define existing (hashmap-ref name->node-map (car (node-label node)) #f))

       (define name-info
         (if existing
             (string->symbol
              (string-append
               (symbol->string (car (node-label node))) "." (~a (cdr (node-label node)))))
             (if (exp-node? node)
                 (begin
                   (set! counter (+ 1 counter))
                   (string->symbol (string-append "$" (~a counter))))
                 (car (node-label node)))))

       (hashmap-set! name->node-map name-info (node-id node))
       (hashmap-set! node->name-map (node-id node) name-info))
     all-references))

  (define useful-refs
    (filter (fp (ref referenced? . children)
                (and referenced?
                     (not (null? children))))
            all-references))

  (define body
    (dereference tree))

  (if (null? useful-refs)
      body
      (cons keyword-let (cons (map tuple-to-binding useful-refs) (list body)))))
