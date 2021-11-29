
%run guile

%var make-fresh-node

%use (make-node) "./node.scm"

%use (raisu) "./euphrates/raisu.scm"

(define make-fresh-node
  (let ((counter 0))
    (lambda (label type children)
      (unless (pair? label)
        (raisu 'non-namepsaced-creation-attempt label type))

      (set! counter (+ 1 counter))
      (make-node counter children label type))))
