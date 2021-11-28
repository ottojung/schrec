
%run guile

%var initialize-rewrite-block

%use (node/directed-children set-node/directed-children! node/directed-label set-node/directed-label!) "./euphrates/node-directed-obj.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (raisu) "./euphrates/raisu.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"

%use (debug) "./euphrates/debug.scm"

(define (initialize-rewrite-block block)
  (define children (node/directed-children block))
  (define free-list (node/directed-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))
  (define scope (list-drop-n 4 children))

  (unless (null? scope)
    (raisu 'too-many-nodes-on-rewrite-block-top-level block))

  (debug "free list: ~s" free-list)

  ;; FIXME(fv-intersection-check): check that rules don't have common free variables?
  (initialize-free-variable! match-pattern)
  (initialize-free-variable! replace-pattern)
  (for-each (lambda (var) (initialize-free-variable! var)) free-list)

  (debug "WHAAAT: ~s" free-list)

  #t)
