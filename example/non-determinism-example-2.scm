
;; non deterministism test 2
(eval ((eval) g
       (eval env body)
       (body))
      (let ((body (x)))
        (fork
         (eval (((x 1 2) g
                 (x)
                 (1)))
               body)
         (eval (((x 1 2) g
                 (x)
                 (2)))
               body))))
