Original:
(let ((body ((body + 2) + 3)))
  ((eva1 (((+ - *) g (a + b) (a * b))
          ((+ - *) a (g + c) (g - c)))
         body)))

Step:
(let ((body ((body - 2) * 3)))
  ((eva1 (((+ - *) g (a + b) (a * b))
          ((+ - *) a (g + c) (g - c)))
         body)))

Step:
(let ((body ((body * 2) - 3)))
  ((eva1 (((+ - *) g (a + b) (a * b))
          ((+ - *) a (g + c) (g - c)))
         body)))
