
;; Evaluator for a graph-based assembly language "gasm".
;; Similar to lisp in that it is based on analogs of `cons`, `car` and `cdr`,
;; but additionaly has `append` and `head` to deconstruct proper lists.
(let ((const (head tail null? cons car eq? if append set! and qq new do begin))
      (var1 (qq (2)))
      (var2 (qq (5 6)))
      (body (do start))
      (start
       (begin
         (new e1)
         (new e2)
         (new e3)
         (new e4)
         (new e5)
         (new e6)

         ;; (set! e1 (head var2))
         ;; (set! e2 (tail var2))
         ;; (set! e4 (head e3))
         ;; (set! e4 (append e1 e2))

         (set! e1 (cons var1 var2))
         (set! e2 (append var1 var2))

         (set! e3 (head e1))
         (set! e4 (head e2))

         (set! e5 (car e1))
         (set! e6 (car e4))

         (ret (vars var1 var2)
              (es e1 e2 e3 e4 e5 e6))

         ;; (set! var1 (cons var1 var2))
         ;; (set! var1 (append (qq (5 7)) (qq (2 3))))

         ;; (set! var1 (append e1 var1))
         ;; (set! var1 (cons var2 var1))
         ;; (set! e4 (head var1))

         ;; (set! var2 (tail var2))
         ;; (if (null? var2) (yes e1 e2 e3 var1 var2) start)

         )))

  ;; null?
  (eva1 (g const
           ((g (do (if (null? (qq x)) then else))
               (do then))))
        (eval (g const
                 (let ((lst-2 (x xs))
                       (lst-1 (qq lst-2))
                       (condition-1 (null? lst-1)))
                   ((g (do if-exp)
                       (do else))
                    (if-exp (if-keyword condition-1 then else) if-exp)
                    (if-keyword if if-keyword)
                    (x x x)
                    (lst-2 lst-2 lst-2)
                    (lst-1 lst-1 lst-1)
                    (condition-1 condition-1 condition-1)
                    (then then then)
                    (else else else)
                    )))
              body))

  ;; eq?
  (eva1 (g const
           ((g (do (if (eq? x y) then else))
               (do else))))
        (eva1 (g const
                 ((g (do (if (keyword-eq (qq x) (qq x)) then else))
                     (do then))
                  (keyword-eq eq? keyword-eq)))
              body))

  ;; new
  (eva1 (g const
           (let ((i (new v)))
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (v v (qq ()))
              (i i i))))
        body)

  ;; set! head
  (eval (g const
           (let ((l (x xs))
                 (q (qq l))
                 (e (head q))
                 (in (set! v e))
                 )
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (i in i)
              (v (qq qv) v)
              (qv qv (x))
              (second second second)
              (l l l)
              (q q q)
              (e e e)
              (x x x)
              )))
        body)

  ;; set! car
  (eval (g const
           (let ((l (x xs))
                 (q (qq l))
                 (e (car q))
                 (in (set! v e))
                 )
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (i in i)
              (v (qq qv) (qq x))
              (second second second)
              (l l l)
              (q q q)
              (e e e)
              (x x x)
              )))
        body)

  ;; set! tail
  (eval (g const
           (let ((l (x xs))
                 (q (qq l))
                 (e (tail q))
                 (in (set! v e))
                 )
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (i in i)
              (v (qq qv) v)
              (qv qv (xs))
              (second second second)
              (l l l)
              (q q q)
              (e e e)
              (x x x)
              )))
        body)

  ;; set! append
  (eval (g const
           (let ((al (al1))
                 (bl (bs))
                 (a (qq al))
                 (b (qq bl))
                 (e (append a b))
                 (i (set! v e))
                 )
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (v (qq qv) v)
              (qv qv (al1 bs))
              (al1 al1 al1)
              (al al al)
              (bl bl bl)
              (a a a)
              (b b b)
              (e e e)
              (i i i)
              (x x x)
              )))
        body)

  ;; set! cons
  (eval (g const
           (let ((bl (bs))
                 (a (qq al))
                 (b (qq bl))
                 (e (cons a b))
                 (i (set! v e)))
             ((g
               (do pair)
               (do second))
              (pair (and i second) pair)
              (v (qq qv) v)
              (qv qv (al bs))
              (al al al)
              (bl bl bl)
              (a a a)
              (b b b)
              (e e e)
              (i i i)
              (x x x)
              )))
        body)

  ;; begin
  (eval (g const
           ((g (begin x1 x2 x3 xs)
               (and x1 (begin x2 x3 xs)))
            (x1 x1 x1)
            (x2 x2 x2)
            (x3 x3 x3)))
        body)
  (eva1 (g const
           ((g (begin x1 x2)
               (and x1 x2))))
        body)

  )
