
%run guile

%var initialize-rewrite-block

%use (node-children set-node-children! node-label set-node-meta!) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (soft-initialize-capture-variable!) "./soft-initialize-capture-variable-bang.scm"

(define (initialize-rewrite-block free-stack block main-input)
  (define children (node-children block))
  (define capture-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define left-overs (list-drop-n 4 children))

  (unless (null? left-overs)
    (raisu 'too-many-nodes-on-rewrite-block-top-level block))

  (for-each (lambda (var) (soft-initialize-capture-variable! var)) capture-list)
  (set-node-meta! block 'initialized)

  #t)
