
;; simple "let" test
(let ((a (m m))
      (m ()))
  (eva1 (g (m a b)     ;; constants
           ((g           ;; input
             (m x)       ;; match pattern
             (x m m)))) ;; replace pattern
        (let ((a a))
          (m a))))
