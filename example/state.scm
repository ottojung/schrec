
;; state test 1
(let ((switch (off)))
  (do ((() g
        (x)
        (x (x)))
       ((switch off on) switch
        (off)
        (on)))
      (body)))
