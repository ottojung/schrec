
%run guile

%var list->graph

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (get-atom-type) "./get-atom-type.scm"
%use (make-fresh-reference) "./make-fresh-reference.scm"

(define (list->graph lst)
  (define H (make-hashmap))
  (let loop ((lst lst))
    (if (pair? lst)
        (make-node/directed (make-fresh-reference #f 'exp) (map loop lst))
        (let ((existing (hashmap-ref H lst #f)))
          (or existing
              (let* ((type (get-atom-type lst))
                     (new (make-node/directed (make-fresh-reference lst type) '())))
                (hashmap-set! H lst new)
                new))))))
