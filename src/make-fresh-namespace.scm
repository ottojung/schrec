
%run guile

%var make-fresh-namespace

(define make-fresh-namespace
  (let ((counter 0))
    (lambda ()
      (set! counter (+ 1 counter))
      counter)))
