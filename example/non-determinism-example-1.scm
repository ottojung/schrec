
;; non deterministism test
(let ((body (x)))
  (fork
   (eva1 g (((x 1 2) g
             (x)
             (1)))
         body)
   (eva1 g (((x 1 2) g
             (x)
             (2)))
         body)))
