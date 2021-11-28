
%run guile

%var make-fresh-regular-reference

%use (make-fresh-reference) "./make-fresh-reference.scm"

(define (make-fresh-regular-reference label)
  (make-fresh-reference label 'regular))
