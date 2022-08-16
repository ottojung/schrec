Original:
(let ((switch (off)))
  ((eva1 (((switch off on) switch (off) (on)) (() g r r))
         (body))))

Step:
(let ((switch (on)))
  ((eva1 (((switch off on) switch (off) (on)) (() g r r))
         (body))))

Step:
(let ((switch (on)))
  ((eva1 (((switch off on) switch (off) (on)) (() g r r))
         (body))))
