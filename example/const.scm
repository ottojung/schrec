
;; replaces all pluses by minuses
(eval (((+ -) g
        (x + y)
        (- x y)))
      (1 + (2 + 3)))