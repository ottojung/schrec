Original:
((eval (((+ -) g (x + y) (- x y))) (1 + (2 + 3))))

Step:
((eval (((+ -) g (x + y) (- x y))) (- 1 (2 + 3))))

Step:
((eval (((+ -) g (x + y) (- x y))) (- 1 (- 2 3))))
