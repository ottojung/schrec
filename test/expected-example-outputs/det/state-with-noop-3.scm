Original:
(let ((switch (off)))
  ((eval (((switch off on) switch (off) (on))
          ((switch) switch switch switch))
         (body))))

Step:
(let ((switch (on)))
  ((eval (((switch off on) switch (off) (on))
          ((switch) switch switch switch))
         (body))))
