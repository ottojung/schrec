
%run guile

%var list->graph

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (get-atom-type) "./get-atom-type.scm"
%use (make-fresh-branch-reference) "./make-fresh-branch-reference.scm"
%use (make-fresh-atom-node) "./make-fresh-atom-node.scm"

(define (list->graph lst)
  (define H (make-hashmap))
  (let loop ((lst lst))
    (if (pair? lst)
        (make-node/directed (make-fresh-branch-reference) (map loop lst))
        (let ((existing (hashmap-ref H lst #f)))
          (or existing
              (let* ((new (make-fresh-atom-node lst)))
                (hashmap-set! H lst new)
                new))))))
