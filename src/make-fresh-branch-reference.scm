
%run guile

%var make-fresh-branch-reference

%use (make-fresh-reference) "./make-fresh-reference.scm"

(define (make-fresh-branch-reference)
  (make-fresh-reference '.EXP 'exp))
