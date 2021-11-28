
%run guile

%var make-node
%var node
%var node?
%var node-children
%var set-node-children!
%var node-id
%var node-label
%var node-type
%var node-meta
%var set-node-meta!

%use (define-type9) "./euphrates/define-type9.scm"

(define-type9 <n>
  (node id children label type meta) node?
  ;; reference part
  (id node-id)

  ;; children part
  (children node-children set-node-children!)

  ;; meta part
  (label node-label)
  (type node-type)
  (meta node-meta set-node-meta!)
  )

(define (make-node id children label type)
  (node id children label type #f))
