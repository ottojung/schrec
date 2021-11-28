
%run guile

%var make-fresh-atom-node

%use (make-fresh-reference) "./make-fresh-reference.scm"
%use (get-atom-type) "./get-atom-type.scm"

(define (make-fresh-atom-node atom children)
  (make-fresh-node atom (get-atom-type atom) children))
