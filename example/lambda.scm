
;; lambda calculus embedding
(let ((got (nil))
      (const (got app abs nil wrap))
      (input (app (abs x (app (abs j (app x j)) x)) (app (abs u (app u 2)) 1))))
  (eva1 ((const g (wrap (wrap w)) (wrap w)))
        (eva1 ((const g (app a1 (wrap w)) (app a1 w)))
              (eva1 ((const g (app (wrap w) a2) (app w a2)))
                    (eva1 ((const got (a1 b1) (nil)))
                          (f1
                           (eva1 ((const
                                   g
                                   (app (abs var body) arg)
                                   (wrap body))
                                  (const got (nil) (var arg)))
                                 input)
                           (eva1 ((const
                                   got
                                   (x arg)
                                   (x arg))
                                  (const
                                   g
                                   (app x y)
                                   (app arg y)))
                                 input)
                           (eva1 ((const
                                   got
                                   (b arg)
                                   (b arg))
                                  (const
                                   g
                                   (app y b)
                                   (app y arg)))
                                 input)
                           (eva1 ((const
                                   got
                                   (b arg)
                                   (b arg))
                                  (const
                                   g
                                   (abs b)
                                   (abs arg)))
                                 input)
                           ))))))
