
%run guile

%var get-atom-type

(define (get-atom-type atom)
  (case atom
    ((case) 'eval)
    ((let) 'let)
    (else 'regular)))
