
;; state test 3 / with double bind
(let ((switch (off)))
  (eval ((() g
          (x)
          (x (x)))
         ((switch off on) switch
          (off)
          (on))
         (() g r r))
        (body)))
