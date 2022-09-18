
;; non deterministism test 2
(eva1 g (((eva1) g
          (eva1 x env body)
          (body)))
      (let ((body (x)))
        (fork
         (eva1 (g (x 1 2)
                  ((g (x) (1))))
               body)
         (eva1 (g (x 1 2)
                  ((g (x) (2))))
               body))))
