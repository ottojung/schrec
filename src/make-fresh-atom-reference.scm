
%run guile

%var make-fresh-atom-reference

%use (make-fresh-reference) "./make-fresh-reference.scm"
%use (get-atom-type) "./get-atom-type.scm"

(define (make-fresh-atom-reference atom)
  (make-fresh-reference atom (get-atom-type atom)))
