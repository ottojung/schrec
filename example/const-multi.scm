
;; replaces pluses by minuses
(eval (((+ -) g
        (x + y)
        (- x y)))
      (1 + 2 + 3 + 4 + 5))
