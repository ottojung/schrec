
%run guile

%var get-atom-type

(define (get-atom-type atom)
  (case atom
    ((case) 'eval)
    ((let) 'let)
    (else
     (if (and (symbol? atom)
              (string-prefix? "_" (symbol->string atom)))
         'wildcard
         'regular))))
