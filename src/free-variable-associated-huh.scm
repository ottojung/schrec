
%run guile

%var free-variable-associated?

%use (free-variable-get-association) "./free-variable-get-association.scm"

(define (free-variable-associated? fv)
  (free-variable-get-association fv))
