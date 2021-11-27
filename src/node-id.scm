
%run guile

%var node-id

%use (node/directed-label) "./euphrates/node-directed-obj.scm"
%use (reference-id) "./reference.scm"

(define node-id
  (compose reference-id node/directed-label))
