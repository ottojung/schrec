
%run guile

%var soft-initialize-capture-variable!

%use (capture-variable?) "./capture-variable-huh.scm"
%use (initialize-capture-variable!) "./initialize-capture-variable-bang.scm"

(define (soft-initialize-capture-variable! node)
  (or (capture-variable? node)
      (initialize-capture-variable! node)))
