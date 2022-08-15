Original:
(let ((switch (off)))
  ((eval (((switch off on) switch (off) (on))
          ((switch) switch r r))
         (body))))

Step:
(let ((switch (on)))
  ((eval (((switch off on) switch (off) (on))
          ((switch) switch r r))
         (body))))
