Original:
(let ((switch (off)))
  ((eva1 (((switch off on) switch (off) (on)))
         (body))))

Step:
(let ((switch (on)))
  ((eva1 (((switch off on) switch (off) (on)))
         (body))))

Step:
(let ((switch (on)))
  ((eva1 (((switch off on) switch (off) (on)))
         (body))))
