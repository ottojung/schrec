
;; state test 1
(let ((switch (off)))
  (eva1 ((() g
          (x)
          (x (x)))
         ((switch off on) switch
          (off)
          (on)))
        (body)))
