
%run guile

%var uninitialize-rewrite-block

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (free-variable?) "./free-variable-huh.scm"

(define (uninitialize-rewrite-block block)
  (define children (node/directed-children block))
  (define free-list (node/directed-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define scope (list-drop-n 3 children))

  (when (free-variable? match-pattern)
    (uninitialize-free-variable! match-pattern))
  (when (free-variable? replace-pattern)
    (uninitialize-free-variable! replace-pattern))
  (for-each (lambda (var) (uninitialize-free-variable! var)) free-list)

  #t)
