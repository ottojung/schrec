Original:
(let ((switch (off)))
  ((eva1 g
         (((switch off on) switch (off) (on))
          ((switch) switch switch switch))
         (body))))

Step:
(let ((switch (on)))
  ((eva1 g
         (((switch off on) switch (off) (on))
          ((switch) switch switch switch))
         (body))))
