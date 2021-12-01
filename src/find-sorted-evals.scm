
%run guile

%var find-sorted-evals

%use (comp) "./euphrates/comp.scm"

%use (node-children node-visited? set-node-visited?!) "./node.scm"
%use (eval-node?) "./eval-node-huh.scm"

;; returns all eval nodes in a bottommost-to-topmost order
(define (find-sorted-evals graph)
  (reverse
   (let loop ((parent #f) (graph graph))
     (if (node-visited? graph) '()
         (begin
           (set-node-visited?! graph #t)
           (let* ((recur (map (comp (loop graph)) (node-children graph)))
                  (ret (apply append recur)))
             (set-node-visited?! graph #f)
             (if (and parent (eval-node? graph))
                 (cons parent ret)
                 ret)))))))
