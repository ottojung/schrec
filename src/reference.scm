
%run guile

%var reference
%var reference?
%var reference-id
%var reference-label
%var reference-type
%var reference-meta

%use (define-type9) "./euphrates/define-type9.scm"

(define-type9 <reference>
  (reference id label type meta) reference?
  (id    reference-id)
  (label reference-label)
  (type  reference-type)
  (meta  reference-meta)
  )
