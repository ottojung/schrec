
;; Evaluator for a stack-based language "gstack".
;; Similar to lisp in that it is based on analogs of `cons`, `car` and `cdr`,
;; but additionaly has `append` and `head` to deconstruct proper lists.
(let ((const (null cons car append head tail null? eq? if push pop do begin and stack))
      (stack ())
      (var1 (2))
      (var2 (5 6))
      (do (start))
      (start
       (begin
         null
         null
         (push var1)
         (pop e0)
         null

         (if null?
             (begin
               (push var2)
               (push var1)
               append
               (pop e1)
               cons
               (pop e2)
               (push e2)
               (pop e9)
               (result e0 e1 e2))
             (should-not-happen start))

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
           (() s1 s1 s2)
           (() s2 (ys) s2))
        body)

  ;; car
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and car rest) doexpr)
           (const stack (s1 ss) (x ss))
           (() s1 (x xs) s1)
           (() x x x))
        body)

  ;; append
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and append rest) doexpr)
           (const stack (s1 s2 ss) ((x ys) ss))
           (() s1 (x) s1)
           (() x x x)
           (() s2 (ys) s2))
        body)

  ;; head (replaces stack's top element by first child of that element)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and head rest) doexpr)
           (const stack (s1 ss) ((x) ss))
           (() s1 (x xs) s1)
           (() x x x))
        body)

  ;; tail (replaces stack's top element by tail children of that element)
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and tail rest) doexpr)
           (const stack (s1 ss) ((xs) ss))
           (() s1 (x xs) s1)
           (() x x x))
        body)

  ;; null?
  (eval g (let ((if-expr (if null? then else)))
            ((const do (if-expr) (then))
             (const if-expr if-expr if-expr)
             (const stack (s1 ss) (ss))
             (() then then then)
             (() else else else)
             (() s1 s1 s1)))
        (eval g ((const do (if-expr) (then))
                 (const if-expr (if-keyword null? then else) if-expr)
                 (const if-keyword if if-keyword)
                 (const stack (s1 ss) (ss))
                 (() s1 (x xs) s1)
                 (() then then then)
                 (() else else else)
                 (() x x x))
              body))

  ;; eq?
  (eval g (let ((if-expr (if eq? then else)))
            ((const do (if-expr) (else))
             (const if-expr if-expr if-expr)
             (const stack (s1 s2 ss) (ss))
             (() then then then)
             (() else else else)
             (() s1 s1 s1)
             (() s2 s2 s2)))
        (eval g ((const do (if-expr) (then))
                 (const if-expr (if-keyword eq? then else) if-expr)
                 (const if-keyword if if-keyword)
                 (const stack (s1 s2 ss) (ss))
                 (() s1 (x xs) s1)
                 (() s2 (x ys) s1)
                 (() then then then)
                 (() else else else)
                 (() x x x))
              body))

  ;; pop
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and pop-expr rest) doexpr)
           (const pop-expr (pop v) pop-expr)
           (const v (cs) (s1))
           (const stack (s1 ss) (ss))
           (() s1 s1 s1))
        body)

  ;; push
  (eval g ((const do (doexpr) (rest))
           (const doexpr (and push-expr rest) doexpr)
           (const push-expr (push v) push-expr)
           (const v (cs) v)
           (const stack (ss) ((cs) ss)))
        body)

  ;; begin
  (eval g ((const g
                  (begin x1 x2 x3 xs)
                  (and x1 (begin x2 x3 xs)))
           (() x1 x1 x1)
           (() x2 x2 x2)
           (() x3 x3 x3))
        start)
  (eva1 g ((const g
                  (begin x1 x2)
                  (and x1 x2)))
        start)

  )
