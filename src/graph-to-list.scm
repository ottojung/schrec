
%run guile

%var graph->list

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (make-node/directed) "./euphrates/node-directed.scm"
%use (make-hashmap hashmap-ref hashmap-set!) "./euphrates/ihashmap.scm"
%use (make-box box-ref box-set!) "./euphrates/box.scm"

(define (graph->list g)
  (define H (make-hashmap))
  (define counter 0)
  (define boxed
    (let loop ((g g))
      (let ((get (hashmap-ref H (node/directed-label g) #f)))
        (if get
            (let* ((B (box-ref get))
                   (cnt (list-ref B 0))
                   (lab? (list-ref B 1))
                   (type (list-ref B 2))
                   (val (list-ref B 3)))
              (case lab?
                ((unlab)
                 (set! counter (+ 1 counter))
                 (set! cnt counter)
                 (box-set! get (list cnt 'lab type (vector cnt val)))))
              (vector cnt))
            (begin
              (let ((B (make-box
                        (if (null? (node/directed-children g))
                            (list -1 'unlab 'leaf (node/directed-label g))
                            (list -1 'unlab 'branch (map loop (node/directed-children g)))))))
                (hashmap-set! H (node/directed-label g) B)
                B))))))

  (let loop ((boxed boxed))
    (if (vector? boxed) boxed
        (let* ((B (box-ref boxed))
               (type (list-ref B 2))
               (val (list-ref B 3)))
          (case type
            ((leaf) val)
            ((branch) (map loop val)))))))
