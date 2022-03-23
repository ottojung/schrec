
;; simple "let" test
(let ((a (m m))
      (m ()))
  (eval (((m a b)     ;; constants
          g           ;; input
          (m x)       ;; match pattern
          (b m))) ;; replace pattern
        (let ((a ()))
          (m a))))
