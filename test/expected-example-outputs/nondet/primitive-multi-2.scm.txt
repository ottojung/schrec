Original:
((eval g
       ((() g (x y z) (y)) (() x o o) (() z m m))
       (1 2 3 4)))

Step:
((eval g
       ((() g (x y z) (y)) (() x o o) (() z m m))
       (2 3)))

Step:
((eval g
       ((() g (x y z) (y)) (() x o o) (() z m m))
       ()))
