
(let ((body (1 + 1 = 2))
      (const (0 1 2 3 4 + = true false))
      (R-addition
       ((0 0 0)
        (0 1 1)
        (0 2 2)
        (1 0 1)
        (1 1 2)
        (1 2 3)
        (2 0 2)
        (2 1 3)
        (2 2 4))))
  (eval (g const
           ((g (x + y = z) (false))
            (x x x) (y y y) (z z z)))
        (eval (let ((tuple (x y z)))
                (g const
                   ((g (x + y = z) (true))
                    (x x x) (y y y) (z z z)
                    (R-addition (xs tuple ys) R-addition)
                    (tuple tuple tuple))))
              body)))
