Original:
(let ((body (x)))
  ((fork (eval (((x 1 2) g (x) (1))) body)
         (eval (((x 1 2) g (x) (2))) body))))

Step:
(let ((body (2)))
  ((fork (eval (((x 1 2) g (x) (1))) body)
         (eval (((x 1 2) g (x) (2))) body))))

Step:
(let ((body (1)))
  ((fork (eval (((x 1 2) g (x) (1))) body)
         (eval (((x 1 2) g (x) (2))) body))))
