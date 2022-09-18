
;; This is recursive functions executor.
;; Construct recursive functions using these base blocks:
;;   zero, succ, (pi n)
;; and combining them with these:
;;   comp, rec, μ
;; Numbers are encoded like so:
;;   0 = (num (i))
;;   1 = (num (i i))
;;   2 = (num (i i i))
;;   3 = (num (i i i i))
;;   ...

(let ((const (zero succ pi comp comp-map rec μ search-μ num i hello))
      (0 (num (i)))
      (1 (num (i i)))
      (2 (num (i i i)))
      (3 (num (i i i i)))
      (4 (num (i i i i i)))
      (5 (num (i i i i i i)))

      (one (comp succ zero))

      (pred (rec zero (pi 0)))
      ;; (pred (rec zero (f x)))
      ;; (pred (rec zero f))

      (add (rec (pi 0) (comp succ (pi 1))))
      (sg (rec zero (comp one (pi 0))))
      (notsg (rec one (comp zero (pi 0))))
      (mul (rec zero (comp add (pi 1) (pi 2))))

      (body
       (results
        ;; (program (pred (succ (succ (succ (succ 0))))))
        ;; (program (pred (succ (succ (succ 0)))))
        ;; (program (pred (succ (succ 0))))
        ;; (program (pred (succ 0)))
        ;; (program (pred 0))

        (program (add (num (i i i i))
                      (num (i i i))))

        ;; (program (add (succ (succ 0))
        ;;               (succ (succ 0))))

        ;; (program (mul (num (i i i))
        ;;               (num (i i i))))

        ;; (program (sg (succ (succ (succ 0)))))
        ;; (program (sg 0))

        ;; (program ((comp f g) x))
        ;; (program ((comp f g) x y))
        ;; (program ((comp f g) x y z w))
        ;; (program ((comp f g h) x y z w))

        ;; (program ((pi 2) 1 2 3 4 5))
        ;; (program ((pi 1) 1 2 3 4 5))
        ;; (program ((pi 0) 1 2 3 4 5))

        ;; (program ((μ notsg) 0))
        ;; (program (one 2 2))

        ;; (program ((rec f g) 0))
        ;; (program ((rec zero g) (succ (succ 0))))
        )))

  ;; projection
  (let ((pa (p0 a args))
        (p0 (pi z))
        (z (num numz))
        (numz (nums)))
    (eval (g const
             ((g (xs pa ys) (xs a ys))
              (pa pa pa)
              (p0 p0 p0)
              (z z z)
              (a a a)
              (numz numz numz)
              (nums nums nums)
              (y y y)))
          body))

  (eval (g const
           ((g (pin x xs) ((pi (num (n1 ns))) xs))
            (pin (pi sn) pin)
            (sn (num (n0 n1 ns)) sn)
            (x x x)
            (n0 n0 n0)
            (n1 n1 n1)
            (f f f)
            (n n n)))
        body)

  ;; zero
  (eval (g const
           ((g (zero xs) (num (i)))))
        body)

  ;; successor
  (eval (o const
           ((o (succ n) (num (i ys)))
            (n (num y) n)
            (y (ys) y)))
        body)

  ;; composition
  (eval (o const
           ((o (comp-map f acc gf xs)
               (f args (g xs)))
            (gf (bl1 g) gf)
            (acc (bl2 args) acc)
            (bl1 bl1 bl1)
            (bl2 bl2 bl2)
            (f f f)
            (g g g)
            (x1 x1 x1)))
        body)
  (eval (o const
           ((o (comp-map f acc gf xs)
               (comp-map f (args (g1 xs)) gf xs))
            (gf (bl2 g1 g2 gs) (bl2 g2 gs))
            (acc (args) acc)
            (bl2 bl2 bl2)
            (f f f)
            (g1 g1 g1)
            (g2 g2 g2)))
        body)
  (eval (o const
           ((o (c xs) (comp-map f (bl1) (bl2 g gs) xs))
            (c (comp f g gs) c)
            (f f f)
            (g g g)))
        body)

  ;; μ-operator
  (eval (o const
           (let ((result (num not0)))
             (o (search-μ f result x args)
                (search-μ f (f (succ x) args) (succ x) args))
             (f f f)
             (x x x)
             (not0 not0 not0)
             (result result result)))
        (eval (o const
                 (let ((n (i))
                       (result (num n)))
                   (o (search-μ-keyword f result x args)
                      ((pi (num (i))) x))
                   (search-μ-keyword search-μ search-μ-keyword)
                   (n n n)
                   (f f f)
                   (x x x)
                   (result result result)))
              body))

  (eval (o const
           (let ((main (μ f)))
             (o (main args)
                (search-μ f (f (num (i))) (num (i)) args))
             (f f f)
             (main main main)))
        body)

  ;; recursion
  (eval (o const
           ((o (rr args n0)
               (f args))
            (rr (rec f g) rr)
            (n0 (num numz) n0)
            (numz (nums) numz)
            (nums nums nums)
            (f f f)
            (g g g)))
        body)

  (eval (o const
           ((o (rr args sm)
               (g (num (x2 xs)) (rr args (num (x2 xs))) args))
            (rr (rec f g) rr)
            (sm (num nl) sm)
            (nl (x1 x2 xs) nl)
            (x1 x1 x1)
            (x2 x2 x2)
            (f f f)
            (g g g)))
        body)

  )
