
;; removes border arguments
(eval (g ()
         ((g (x y z) (y))
          (x x x)
          (z z z)))
      (1 2 3 4 5 6))
