
;; simple (deterministic) addition
(eva1 (g (+ s 0)     ;; constants
         ((g           ;; input
           ((s x) + 0) ;; match pattern
           (s x))))     ;; replace pattern
      (eva1 (g (+ s 0)     ;; constants
               ((g           ;; input
                 ((0 + 0) + x) ;; match pattern
                 (0 + x))))     ;; replace pattern
            (eva1 (g (+ s 0)     ;; constants
                     ((g           ;; input
                       (x + (0 + 0)) ;; match pattern
                       (x + 0))))     ;; replace pattern
                  (eva1 (g (+ s 0)     ;; constants
                           ((g           ;; input
                             (s (0 + 0)) ;; match pattern
                             (s 0))))     ;; replace pattern
                        (eva1 (g (+ s 0)     ;; constants
                                 ((g           ;; input
                                   (0 + (s x)) ;; match pattern
                                   (s x))))     ;; replace pattern
                              (eva1 (g (+ s 0)     ;; constants
                                       ((g           ;; input
                                         (x + (s y)) ;; match pattern
                                         (s (x + y)))))     ;; replace pattern
                                    ((s (s 0)) + (s (0 + (s ((s 0) + 0)))))))))))
