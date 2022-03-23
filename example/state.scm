
;; state test 1
(let ((switch (off)))
  (eval ((() g
          (x)
          (x (x)))
         ((switch off on) switch
          (off)
          (on)))
        (body)))
