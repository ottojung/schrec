
;; Evaluator for a stack-based language "gstack".
;; Similar to lisp in that it is based on analogs of `cons`, `car` and `cdr`,
;; and also the "set" instruction that is like "set-car!" and "set-cdr!".
(let ((const (null cons car cdr set
              push pop
              if null? eq? and
              do stack))
      (stack ())
      (var1 (2))
      (var2 ((5 6)))
      (do (start))
      (start
       (begin
         null
         null
         (push var1)
         (pop e0)
         null

         ;; null
         ;; (push var1)
         ;; (if null? yes no)

         (if null?
             (begin
               (push var1)
               (push var2)
               car
               cons
               (pop e1)
               cons
               (push e1)
               (push e1)
               set
               (pop e2)
               (push e2)
               (pop e9)
               (result e0 e1 e2))
             (should-not-happen do stack))

         )))

  ;; null (pushes a fresh node with 0 children on the top of the stack)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and null rest) doexpr)
           (const stack (ss) (() ss)))
        body)

  ;; cons (pushes a pair to the top of the stack)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and cons rest) doexpr)
           (const stack (s1 s2 ss) ((s1 ys) ss))
           (() s1 s1 s1)
           (() s2 (ys) s2))
        body)

  ;; car
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and car rest) doexpr)
           (const stack (s1 ss) (x ss))
           (() s1 (x xs) s1)
           (() x x x))
        body)

  ;; cdr (replaces stack's top element by cdr children of that element)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and cdr rest) doexpr)
           (const stack (s1 ss) ((xs) ss))
           (() s1 (x xs) s1)
           (() x x x))
        body)

  ;; set (modifies the top of the stack)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and set rest) doexpr)
           (const stack (s1 s2 ss) (s2 ss))
           (() s1 (xs) s1)
           (() s2 (ys) (xs)))
        body)

  ;; push
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and push-expr rest) doexpr)
           (const push-expr (push v) push-expr)
           (const v (x) v)
           (const stack (ss) (x ss))
           (() x x x))
        body)

  ;; pop
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and pop-expr rest) doexpr)
           (const pop-expr (pop v) pop-expr)
           (const v (cs) (s1))
           (const stack (s1 ss) (ss))
           (() s1 s1 s1))
        body)

  ;; null?
  (eval g ((const do (doexpr) (then))
           (const doexpr (if null? then else) doexpr)
           (const stack (s1 ss) (ss))
           (() then then then)
           (() else else else)
           (() s1 s1 s1))
        (eval g ((const do (doexpr) (else))
                 (const doexpr (if null? then else) doexpr)
                 (const stack (s1 ss) (ss))
                 (() s1 (x xs) s1)
                 (() then then then)
                 (() else else else)
                 (() x x x))
              body))

  ;; eq?
  (eval g ((const do (doexpr) (else))
           (const doexpr (if eq? then else) doexpr)
           (const stack (s1 s2 ss) (ss))
           (() then then then)
           (() else else else)
           (() s1 s1 s1)
           (() s2 s2 s2))
        (eval g ((const do (doexpr) (then))
                 (const doexpr (if eq? then else) doexpr)
                 (const stack (s1 s1 ss) (ss))
                 (() s1 s1 s1)
                 (() then then then)
                 (() else else else))
              body))

  ;; begin
  (eval g (((and begin) g
            (begin x1 x2 x3 xs)
            (and x1 (begin x2 x3 xs)))
           (() x1 x1 x1)
           (() x2 x2 x2)
           (() x3 x3 x3))
        start)
  (eva1 g (((and begin) g
            (begin x1 x2)
            (and x1 x2)))
        start)

  )
