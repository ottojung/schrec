
;; lambda calculus embedding
(let ((got (nil))
      (const (got app abs nil wrap))
      (input (app (abs x (app (abs j (app x j)) x)) (app (abs u (app u 2)) 1))))
  (eval ((const g (wrap (wrap w)) (wrap w)))
        (eval ((const g (app a1 (wrap w)) (app a1 w)))
              (eval ((const g (app (wrap w) a2) (app w a2)))
                    (eval ((const got (a1 b1) (nil)))
                          (f1
                           (eval ((const
                                   g
                                   (app (abs var body) arg)
                                   (wrap body))
                                  (const got (nil) (var arg)))
                                 input)
                           (eval ((const
                                   got
                                   (x arg)
                                   (x arg))
                                  (const
                                   g
                                   (app x y)
                                   (app arg y)))
                                 input)
                           (eval ((const
                                   got
                                   (b arg)
                                   (b arg))
                                  (const
                                   g
                                   (app y b)
                                   (app y arg)))
                                 input)
                           (eval ((const
                                   got
                                   (b arg)
                                   (b arg))
                                  (const
                                   g
                                   (abs b)
                                   (abs arg)))
                                 input)
                           ))))))
