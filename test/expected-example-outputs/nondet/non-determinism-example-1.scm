Original:
(let ((body (x)))
  ((fork (eva1 (((x 1 2) g (x) (1))) body)
         (eva1 (((x 1 2) g (x) (2))) body))))

Step:
(let ((body (2)))
  ((fork (eva1 (((x 1 2) g (x) (1))) body)
         (eva1 (((x 1 2) g (x) (2))) body))))

Step:
(let ((body (1)))
  ((fork (eva1 (((x 1 2) g (x) (1))) body)
         (eva1 (((x 1 2) g (x) (2))) body))))
