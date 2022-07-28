Original:
(let ((pat (a pat)) (body-looped (x body-looped)))
  ((eval (((0) g pat (0))) (body-looped (x y)))))

Step:
(let ((pat (a pat)))
  ((eval (((0) g pat (0))) ((0) (x y)))))
