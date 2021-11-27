
%run guile

%var make-fresh-reference

%use (reference) "./reference.scm"

(define make-fresh-reference
  (let ((counter 0))
    (lambda (label type)
      (set! counter (+ 1 counter))
      (reference counter label type))))
