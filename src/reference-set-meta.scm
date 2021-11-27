
%run guile

%var reference-set-meta

%use (reference reference-id reference-label reference-type) "./reference.scm"

(define (reference-set-meta ref new-meta)
  (reference (reference-id ref)
             (reference-label ref)
             (reference-type ref)
             new-meta))
