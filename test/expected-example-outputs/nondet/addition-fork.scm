Original:
(let ((body ((s (s 0)) + (s (0 + (s ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (0 + (s ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (0 + ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s ((s 0) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (0 + (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s ((s 0) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (0 + (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s ((s 0) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (0 + (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + ((s 0) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + ((s 0) + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + ((s 0) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (0 + (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body ((s (s 0)) + (s (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s ((s (s 0)) + (s (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + (0 + 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s ((s (s 0)) + (s 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s ((s (s 0)) + 0))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))

Step:
(let ((body (s (s (s (s (s 0)))))))
  ((fork (eval (((+ s 0) g ((s x) + 0) (s x))) body)
         (eval (((+ s 0) g ((0 + 0) + x) (0 + x))) body)
         (eval (((+ s 0) g (x + (0 + 0)) (x + 0))) body)
         (eval (((+ s 0) g (s (0 + 0)) (s 0))) body)
         (eval (((+ s 0) g (0 + (s x)) (s x))) body)
         (eval (((+ s 0) g (x + (s y)) (s (x + y)))) body))))
