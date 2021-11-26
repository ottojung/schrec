
%run guile

%var list->graph

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (reference) "./reference.scm"

(define (list->graph lst)
  (define count 0)
  (define H (make-hashmap))
  (let loop ((lst lst))
    (if (pair? lst)
        (begin
          (set! count (+ 1 count))
          (make-node/directed (reference count 'nolabel 'exp) (map loop lst)))
        (let ((existing (hashmap-ref H lst #f)))
          (or existing
              (begin
                (set! count (+ 1 count))
                (let ((new (make-node/directed (reference count lst 'regular) '())))
                  (hashmap-set! H lst new)
                  new)))))))
