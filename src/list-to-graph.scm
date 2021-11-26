
%run guile

%var list->graph

%use (node/directed? node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"

(define (list->graph lst0)
  (define (recur lst1)
    (define count 0)
    (let loop ((lst lst1))
      (set! count (+ 1 count))
      (if (pair? lst)
          (make-node/directed count (map loop lst))
          (make-node/directed lst '()))))

  (make-node/directed 'root (map recur lst0)))
