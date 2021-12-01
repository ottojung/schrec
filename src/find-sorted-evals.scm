
%run guile

%var find-sorted-evals

;; returns all eval nodes in a bottommost-to-topmost order
(define (find-sorted-evals graph)
  (reverse
   (let loop ((parent #f) (graph graph))
     (if (node-visited? graph) '()
         (begin
           (set-node-visited?! graph #t)
           (let ((ret
                  (if (eval-node? graph) parent
                      (apply append (cons (list parent)
                                          (map (lambda (child) (loop graph child))
                                               (node-children graph)))))))
             (set-node-visited?! graph #f)
             ret))))))
