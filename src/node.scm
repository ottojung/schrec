
%run guile

%var make-node
%var node
%var node?
%var node-children
%var set-node-children!
%var node-label
%var set-node-label!

%use (define-type9) "./euphrates/define-type9.scm"

(define-type9 <n>
  (node label children) node?
  (label node-label set-node-label!)
  (children node-children set-node-children!)
  )


(define (make-node label children)
  (node label children))
