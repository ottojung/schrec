
;; Evaluator of Lisp code restricted to list operations and `if' keyword.
;; Works on qqd source code, so this is an embedding.
;; Input program is written to the `body' variable.
;; Variables are simply references to nodes, no special "let*" construct for them is needed.
(let ((const (head tail null? insert eq? if append set! and qq define do begin))
      (var1 (qq (2)))
      (var2 (qq (5 6)))
      (body (do start))
      (start
       (begin
         (define e1)
         (define e2)
         (define e3)
         (define e4)

         ;; (set! e1 (head var2))
         ;; (set! e2 (tail var2))
         ;; (set! e4 (head e3))
         ;; (set! e4 (append e1 e2))

         (set! e1 (insert var1 var2))
         (set! e2 (append var1 var2))

         (set! e3 (head e1))
         (set! e4 (head e2))

         (done e1 e2 e3 e4 var1 var2)

         ;; (set! var1 (insert var1 var2))
         ;; (set! var1 (append (qq (5 7)) (qq (2 3))))

         ;; (set! var1 (append e1 var1))
         ;; (set! var1 (insert var2 var1))
         ;; (set! e4 (head var1))

         ;; (set! var2 (tail var2))
         ;; (if (null? var2) (yes e1 e2 e3 var1 var2) start)

         )))

  ;; null?
  (eva1 g
        ((const g
                (do (if (null? (qq x)) then else))
                (do then)))
        (eval g
              (let ((lst-2 (x xs))
                    (lst-1 (qq lst-2))
                    (condition-1 (null? lst-1)))
                ((const g
                        (do if-exp)
                        (do else))
                 (const if-exp (if-keyword condition-1 then else) if-exp)
                 (const if-keyword if if-keyword)
                 (() x x x)
                 (() lst-2 lst-2 lst-2)
                 (() lst-1 lst-1 lst-1)
                 (() condition-1 condition-1 condition-1)
                 (() then then then)
                 (() else else else)
                 ))
              body))

  ;; eq?
  (eva1 g
        ((const g
                (do (if (eq? x y) then else))
                (do else)))
        (eva1 g
              ((const g
                      (do (if (keyword-eq (qq x) (qq x)) then else))
                      (do then))
               (const keyword-eq eq? keyword-eq))
              body))

  ;; define
  (eva1 g
        (let ((i (define v)))
          ((const g
                  (do pair)
                  (do second))
           (const pair (and i second) pair)
           (const v v (qq (())))
           (() i i i)))
        body)

  ;; set! head
  (eval g
        (let ((l (x xs))
              (q (qq l))
              (e (head q))
              (in (set! v e))
              )
          ((const g
                  (do pair)
                  (do second))
           (const pair (and i second) pair)
           (const i in i)
           (const v (qq qv) v)
           (() qv qv (x))
           (() second second second)
           (() l l l)
           (() q q q)
           (() e e e)
           (() x x x)
           ))
        body)

  ;; set! tail
  (eval g
        (let ((l (x xs))
              (q (qq l))
              (e (tail q))
              (in (set! v e))
              )
          ((const g
                  (do pair)
                  (do second))
           (const pair (and i second) pair)
           (const i in i)
           (const v (qq qv) v)
           (() qv qv (xs))
           (() second second second)
           (() l l l)
           (() q q q)
           (() e e e)
           (() x x x)
           ))
        body)

  ;; set! append
  (eval g
        (let ((al (al1))
              (bl (bs))
              (a (qq al))
              (b (qq bl))
              (e (append a b))
              (i (set! v e))
              )
          ((const g
                  (do pair)
                  (do second))
           (const pair (and i second) pair)
           (const v (qq qv) v)
           (() qv qv (al1 bs))
           (() al1 al1 al1)
           (() al al al)
           (() bl bl bl)
           (() a a a)
           (() b b b)
           (() e e e)
           (() i i i)
           (() x x x)
           ))
        body)

  ;; set! insert
  (eval g
        (let ((bl (bs))
              (a (qq al))
              (b (qq bl))
              (e (insert a b))
              (i (set! v e))
              )
          ((const g
                  (do pair)
                  (do second))
           (const pair (and i second) pair)
           (const v (qq qv) v)
           (() qv qv (al bs))
           (() al al al)
           (() bl bl bl)
           (() a a a)
           (() b b b)
           (() e e e)
           (() i i i)
           (() x x x)
           ))
        body)

  ;; begin
  (eval g ((const g
                  (begin x1 x2 x3 xs)
                  (and x1 (begin x2 x3 xs)))
           (() x1 x1 x1)
           (() x2 x2 x2)
           (() x3 x3 x3))
        body)
  (eva1 g ((const g
                  (begin x1 x2)
                  (and x1 x2)))
        body)

  )
