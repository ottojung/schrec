
%run guile

%var make-fresh-wildcard-reference

%use (make-fresh-reference) "./make-fresh-reference.scm"

(define (make-fresh-wildcard-reference)
  (make-fresh-reference '_ 'wildcard))
