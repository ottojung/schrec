
%run guile

%var rewrite-rewrite-block

%use (node-children set-node-children! node-label node-meta) "./node.scm"
%use (list-drop-n) "./euphrates/list-drop-n.scm"
%use (associate-free-variable!) "./associate-free-variable-bang.scm"
%use (initialize-free-variable!) "./initialize-free-variable-bang.scm"
%use (reinitialize-free-variable!) "./reinitialize-free-variable-bang.scm"
%use (uninitialize-free-variable!) "./uninitialize-free-variable-bang.scm"
%use (run-rewrite-pattern) "./run-rewrite-pattern.scm"
%use (free-variable?) "./free-variable-huh.scm"
%use (free-variable-get-association) "./free-variable-get-association.scm"

(define (rewrite-rewrite-block block main-input)
  (define children (node-children block))
  (define free-list (node-children (list-ref children 0)))
  (define input-node (list-ref children 1))
  (define match-pattern (list-ref children 2))
  (define replace-pattern (list-ref children 3))

  (or (not (equal? 'matched (node-meta block)))
      (let ((input-val (if (free-variable? input-node)
                           (free-variable-get-association input-node)
                           input-node)))
        (and
         (associate-free-variable! replace-pattern input-val)
         (run-rewrite-pattern replace-pattern)))))
