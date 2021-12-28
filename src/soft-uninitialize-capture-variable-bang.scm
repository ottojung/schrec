
%run guile

%var soft-uninitialize-capture-variable!

%use (node-meta) "./node.scm"
%use (uninitialize-capture-variable!) "./uninitialize-capture-variable-bang.scm"

(define (soft-uninitialize-capture-variable! node)
  (or (not (node-meta node))
      (uninitialize-capture-variable! node)))
