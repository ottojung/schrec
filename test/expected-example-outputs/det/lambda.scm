Original:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (app (abs x (app (abs j (app x j)) x))
                  (app (abs u (app u 2)) 1))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (x (app (abs u (app u 2)) 1)))
      (input (wrap (app (abs j (app x j)) x))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (x $1))
      ($1 (app (abs u (app u 2)) 1))
      (input (wrap (app (abs j (app x j)) $1))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (x $1))
      ($1 (app (abs u (app u 2)) 1))
      (input (wrap (app (abs j (app $1 j)) $1))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (app (abs j (app $1 j)) $1)))
      ($1 (app (abs u (app u 2)) 1)))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (j $1))
      ($1 (app (abs u (app u 2)) 1))
      (input (wrap (wrap (app $1 j)))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (j $1))
      ($1 (app (abs u (app u 2)) 1))
      (input (wrap (wrap (app $1 $1)))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (wrap (app $1 $1))))
      ($1 (app (abs u (app u 2)) 1)))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (u 1))
      (input (wrap (wrap (app $1 $1))))
      ($1 (wrap (app u 2))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (u 1))
      (input (wrap (wrap (app $1 $1))))
      ($1 (wrap (app 1 2))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (wrap (app $1 $1))))
      ($1 (wrap (app 1 2))))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (wrap (app $1 (wrap $1)))))
      ($1 (app 1 2)))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (wrap (app $1 $1))))
      ($1 (app 1 2)))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))

Step:
(let ((const (got app abs nil wrap))
      (got (nil))
      (input (wrap (app $1 $1)))
      ($1 (app 1 2)))
  ((eva1 g
         ((const g (wrap (wrap w)) (wrap w)))
         (eva1 g
               ((const g (app a1 (wrap w)) (app a1 w)))
               (eva1 g
                     ((const g (app (wrap w) a2) (app w a2)))
                     (eva1 g
                           ((const got (a1 b1) (nil)))
                           (f1 (eva1 g
                                     ((const g
                                             (app (abs var body) arg)
                                             (wrap body))
                                      (const got (nil) (var arg)))
                                     input)
                               (eva1 g
                                     ((const got (x arg) (x arg))
                                      (const g (app x y) (app arg y)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (app y b) (app y arg)))
                                     input)
                               (eva1 g
                                     ((const got (b arg) (b arg))
                                      (const g (abs b) (abs arg)))
                                     input))))))))
