Original:
(let ((body (x)))
  ((fork (eval (((x 0) g (x) (0))) body)
         (eval (((x 1) g (x) (1))) body))))

Step:
(let ((body (1)))
  ((fork (eval (((x 0) g (x) (0))) body)
         (eval (((x 1) g (x) (1))) body))))

Step:
(let ((body (0)))
  ((fork (eval (((x 0) g (x) (0))) body)
         (eval (((x 1) g (x) (1))) body))))