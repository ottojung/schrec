
;; lambda calculus embedding
(let ((got (nil))
      (const (got app abs nil wrap))
      (input (app (abs x (app (abs j (app x j)) x))
                  (app (abs u (app u 2)) 1))))
  (eva1 (g const ((g (wrap (wrap w)) (wrap w))))
        (eva1 (g const ((g (app a1 (wrap w)) (app a1 w))))
              (eva1 (g const ((g (app (wrap w) a2) (app w a2))))
                    (eva1 (g const ((got (a1 b1) (nil))))
                          (f1 (eva1 (g const
                                       ((g (app (abs var body) arg)
                                           (wrap body))
                                        (got (nil) (var arg))))
                                    input)
                              (eva1 (g const
                                       ((got (x arg) (x arg))
                                        (g (app x y) (app arg y))))
                                    input)
                              (eva1 (g const
                                       ((got (b arg) (b arg))
                                        (g (app y b) (app y arg))))
                                    input)
                              (eva1 (g const
                                       ((got (b arg) (b arg))
                                        (g (abs b) (abs arg))))
                                    input)))))))
