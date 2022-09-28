
(let ((const (0 1 / undefined)))
  (eval (g const
           ((g (x / x) (1))))
        (eval (g const
                 ((g (x / 0) (undefined))))
              (3 + (5 / 5)))))
