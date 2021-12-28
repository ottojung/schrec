
%run guile

%var transform-let-bindings

(define (transform-let-bindings bindings)
  (map
   (lambda (b)
     (if (symbol? b) (list b '()) b))
   bindings))
