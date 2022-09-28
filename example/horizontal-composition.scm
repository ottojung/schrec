
(let ((body (1 + 2 + 3))
      (const (+)))
  (eval (g const
           ((g (x + y) (x))))
        body))
