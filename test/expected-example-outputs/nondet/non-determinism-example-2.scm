Original:
(let ((body.1 (x)))
  ((eval ((eval) g (eval env body) (body))
         (fork (eval (((x 1 2) g (x) (1))) body.1)
               (eval (((x 1 2) g (x) (2))) body.1)))))

Step:
(let ((body.1 (2)))
  ((eval ((eval) g (eval env body) (body))
         (fork (eval (((x 1 2) g (x) (1))) body.1)
               (eval (((x 1 2) g (x) (2))) body.1)))))

Step:
(let ((body.1 (1)))
  ((eval ((eval) g (eval env body) (body))
         (fork (eval (((x 1 2) g (x) (1))) body.1)
               (eval (((x 1 2) g (x) (2))) body.1)))))
