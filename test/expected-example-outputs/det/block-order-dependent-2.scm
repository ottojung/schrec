Original:
(let ((body ((body + 2) + 3)))
  ((eva1 g
         (((+ - *) a (g + c) (g - c))
          ((+ - *) g (a + b) (a * b)))
         body)))

Step:
(let ((body ((body * 2) - 3)))
  ((eva1 g
         (((+ - *) a (g + c) (g - c))
          ((+ - *) g (a + b) (a * b)))
         body)))
