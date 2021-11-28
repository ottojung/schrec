
%run guile

%var node-id

%use (node-label) "./node.scm"
%use (reference-id) "./reference.scm"

(define node-id
  (compose reference-id node-label))
