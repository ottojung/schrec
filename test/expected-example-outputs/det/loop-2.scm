Original:
(let ((body (x body)))
  ((eval (((x 1 2) g (x y) (1 y))) body)))

Step:
(let ((body (1 body)))
  ((eval (((x 1 2) g (x y) (1 y))) body)))
