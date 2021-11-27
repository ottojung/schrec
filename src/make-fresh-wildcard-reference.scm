
%run guile

%var make-fresh-wildcard-reference

%use (reference) "./reference.scm"

(define make-fresh-wildcard-reference
  (let ((counter 0))
    (lambda ()
      (set! counter (+ 1 counter))
      (reference (cons counter 'fresh) '_ 'wildcard))))
