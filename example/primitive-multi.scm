
;; removes middle arguments (warn: does not halt)
(eval (g ()
         ((g (x y z) (x z))))
      (1 2 3 4))
