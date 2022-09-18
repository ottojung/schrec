
;; shuffles (warn: does not halt)
;; try to replace the last `3' and the match should fail
(eval (g (+ -)
         ((g (x (y z))
             (z (x y)))
          (x x x)
          (y y y)))
      (1 (2 3) (2 3)))
