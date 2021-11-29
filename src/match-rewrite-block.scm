
%run guile

%var match-rewrite-block

%use (node-children set-node-children! node-label set-node-meta!) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (run-match-pattern) "./run-match-pattern.scm"
%use (free-variable?) "./free-variable-huh.scm"

(define (match-rewrite-block block main-input)
  (define children (node-children block))
  (define free-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (when (free-variable? input-node)
    (associate-free-variable! input-node main-input))

  (let ((result (run-match-pattern match-pattern input-node)))
    (set-node-meta! block (if result 'matched 'not-matched))
    result))
