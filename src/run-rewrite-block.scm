
%run guile

%var run-rewrite-block

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"

(define (run-rewrite-block input block)
  (define children (node/directed-children block))
  (define free-list (list-ref children 0))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define scope (list-drop-n children 3))

  (for-each (lambda (var) (initialize-free-variable!

  (and (associate-free-variable! input-node input)
       
