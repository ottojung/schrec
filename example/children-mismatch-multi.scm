
;; modification of shuffles that does not match
(eval (g (+ -)
         ((g (x (y z)) (z (x y)))
          (x x x)
          (y y y)))
      (1 (2 3) (2 4)))
