Original:
(let ((body (x)))
  ((fork (eva1 g (((x 0) g (x) (0))) body)
         (eva1 g (((x 1) g (x) (1))) body))))

Step:
(let ((body (1)))
  ((fork (eva1 g (((x 0) g (x) (0))) body)
         (eva1 g (((x 1) g (x) (1))) body))))

Step:
(let ((body (0)))
  ((fork (eva1 g (((x 0) g (x) (0))) body)
         (eva1 g (((x 1) g (x) (1))) body))))
