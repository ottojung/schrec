Original:
(let ((switch (off)))
  ((eval (((switch off on) switch (off) (on)) (() g r r))
         (body))))

Step:
(let ((switch (on)))
  ((eval (((switch off on) switch (off) (on)) (() g r r))
         (body))))

Step:
(let ((switch (on)))
  ((eval (((switch off on) switch (off) (on)) (() g r r))
         (body))))
