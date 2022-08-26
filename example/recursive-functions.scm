
;; This is recursive functions executor.
;; Construct recursive functions using these base blocks:
;;   zero, succ, (pi n)
;; and combining them with these:
;;   comp, rec, mu
;; Numbers are encoded like so:
;;   0 = (num (i))
;;   1 = (num (i i))
;;   2 = (num (i i i))
;;   3 = (num (i i i i))
;;   ...

(let ((const (zero succ pi comp comp-map rec mu num i))
      (0 (num (i)))
      (1 (num (i i)))
      (2 (num (i i i)))
      (3 (num (i i i i)))
      (4 (num (i i i i i)))
      (5 (num (i i i i i i)))

      (pred (rec zero (pi 0)))
      ;; (pred (rec zero (f x)))
      ;; (pred (rec zero f))

      (add (rec (pi 0) (comp (pi 1) succ)))
      (sg (rec zero (comp (pi 0) (comp succ zero))))

      ;; (program (pred (succ (succ (succ (succ 0))))))
      ;; (program (pred (succ (succ (succ 0)))))
      ;; (program (pred (succ (succ 0))))
      ;; (program (pred (succ 0)))
      ;; (program (pred 0))

      ;; (program (add (succ (succ (succ (succ 0))))
      ;;               (succ (succ (succ (succ (succ 0)))))))
      ;; (program (add (succ (succ 0))
      ;;               (succ (succ 0))))

      (program (sg (succ (succ (succ 0)))))
      ;; (program (sg 0))

      ;; (program ((comp f g) x))
      ;; (program ((comp f g) x y))

      ;; (program ((pi 2) 1 2 3 4 5))
      ;; (program ((pi 1) 1 2 3 4 5))
      ;; (program ((pi 0) 1 2 3 4 5))

      ;; (program ((rec f g) 0))
      ;; (program ((rec zero g) (succ (succ 0))))

      (body (result program))
      )

  (eval o ((const o
                  (f args cm)
                  (f args (g x1)))
           (const cm (comp-map g x1) cm)
           (() f f f)
           (() g g g)
           (() x1 x1 x1))
        body)
  (eval o ((const o
                  (f args cm)
                  (f args (g x1) cm))
           (const cm (comp-map g x1 x2 xs) (comp-map g x2 xs))
           (() f f f)
           (() g g g)
           (() x1 x1 x1)
           (() x2 x2 x2))
        body)
  (eval o ((const o (c x xs) (f (comp-map g x xs)))
           (const c (comp f g) c)
           (() f f f)
           (() g g g)
           (() x x x))
        body)

  (eval g ((const g (f xs pa ys) (f xs a ys))
           (const pa (p0 a args) pa)
           (const p0 (pi z) p0)
           (const z (num numz) z)
           (const a (num y) a)
           (() numz (nums) numz)
           (() nums nums nums)
           (() y y y)
           (() f f f))
        body)

  (eval g ((const g (pin x xs) ((pi (num (n1 ns))) xs))
           (const pin (pi sn) pin)
           (const sn (num (n0 n1 ns)) sn)
           (const x (num y) x)
           (() n0 n0 n0)
           (() n1 n1 n1)
           (() f f f)
           (() y y y)
           (() n n n))
        body)

  (eval g ((const g (zero xs) (num (i))))
        body)

  (eval o ((const o (succ n) (num (i ys)))
           (const n (num y) n)
           (() y (ys) y))
        body)

  (eval o ((const o
                  (rr args n0)
                  (f args))
           (const rr (rec f g) rr)
           (const n0 (num numz) n0)
           (() numz (nums) numz)
           (() nums nums nums)
           (() f f f)
           (() g g g))
        body)

  (eval o ((const o
                  (rr args sm)
                  (g (num (x2 xs)) (rr args (num (x2 xs))) args))
           (const rr (rec f g) rr)
           (const sm (num nl) sm)
           (() nl (x1 x2 xs) nl)
           (() x1 x1 x1)
           (() x2 x2 x2)
           (() f f f)
           (() g g g))
        body)

  )
