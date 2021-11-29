
%run guile

%var uninitialize-rewrite-block

%use (node-children set-node-children! node-label set-node-meta!) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (free-variable?) "./free-variable-huh.scm"

(define (uninitialize-rewrite-block block main-input)
  (define children (node-children block))
  (define free-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (when (free-variable? match-pattern)
    (uninitialize-free-variable! match-pattern))
  (when (free-variable? replace-pattern)
    (uninitialize-free-variable! replace-pattern))
  (for-each (lambda (var) (uninitialize-free-variable! var)) free-list)
  (set-node-meta! block #f)

  #t)
