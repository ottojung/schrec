
;; non deterministism test 2
(eva1 (((eva1) g
        (eva1 env body)
        (body)))
      (let ((body (x)))
        (fork
         (eva1 (((x 1 2) g
                 (x)
                 (1)))
               body)
         (eva1 (((x 1 2) g
                 (x)
                 (2)))
               body))))
