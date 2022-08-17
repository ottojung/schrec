Original:
(let ((body.1 (x)))
  ((eva1 g
         (((eva1) g (eva1 x env body) (body)))
         (fork (eva1 g (((x 1 2) g (x) (1))) body.1)
               (eva1 g (((x 1 2) g (x) (2))) body.1)))))

Step:
(let ((body.1 (2)))
  ((eva1 g
         (((eva1) g (eva1 x env body) (body)))
         (fork (eva1 g (((x 1 2) g (x) (1))) body.1)
               (eva1 g (((x 1 2) g (x) (2))) body.1)))))

Step:
(let ((body.1 (2)))
  ((eva1 g
         (((eva1) g (eva1 x env body) (body)))
         (fork (body.1)
               (eva1 g (((x 1 2) g (x) (2))) body.1)))))

Step:
(let ((body.1 (2)))
  ((eva1 g
         (((eva1) g (eva1 x env body) (body)))
         (fork (body.1) (body.1)))))
