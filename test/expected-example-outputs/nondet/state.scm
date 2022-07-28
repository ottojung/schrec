Original:
(let ((switch (off)))
  ((eval ((() g (x) (x (x)))
          ((switch off on) switch (off) (on)))
         (body))))

Step:
(let ((switch (on)))
  ((eval ((() g (x) (x (x)))
          ((switch off on) switch (off) (on)))
         (body (body)))))
