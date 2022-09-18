
;; removes border arguments
(eval (g ()
         ((g (x y z) (y))
          (x o o)
          (z m m)))
      (1 2 3 4))
