
%run guile

%var make-fresh-node

%use (make-node) "./node.scm"

(define make-fresh-node
  (let ((counter 0))
    (lambda (label type children)
      (set! counter (+ 1 counter))
      (make-node counter children label type))))
