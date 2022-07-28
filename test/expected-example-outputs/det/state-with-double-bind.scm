Original:
(let ((switch (off)))
  ((eval ((() g (x) (x (x)))
          ((switch off on) switch (off) (on))
          (() g r r))
         (body))))

Step:
(let ((switch (on)))
  ((eval ((() g (x) (x (x)))
          ((switch off on) switch (off) (on))
          (() g r r))
         (body (body)))))
