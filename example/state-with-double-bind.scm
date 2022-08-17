
;; state test 3 / with double bind
(let ((switch (off)))
  (eva1 g ((() g
          (x)
          (x (x)))
         ((switch off on) switch
          (off)
          (on))
         (() g r r))
        (body)))
