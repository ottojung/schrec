
;; Evaluator for a stack-based language "gstack".
;; Similar to lisp in that it is based on analogs of `cons`, `car` and `cdr`,
;; and also the "set" instruction that is like "set-car!" and "set-cdr!".
;; Also contains a "syntax sugar" for "and" -- the "progn".
(let ((const (null cons car cdr set
                   push pop
                   if null? eq? and
                   do stack))
      (stack (bot))
      (do (start))
      (x ((1 2 3 4 5 6)))
      (r ())
      (start
       (let ((loop
              (progn
                (pop int)
                (push int)
                (if null?
                    (return r)
                    (progn
                      (push r)
                      (push int)
                      car
                      cons
                      (pop r)
                      (push int)
                      cdr
                      loop)))))
         (progn
           null
           (pop r)
           (push x)
           loop))))

  ;; null (pushes a fresh node with 0 children on the top of the stack)
  (eval (g const
           ((do (command) (rest))
            (command (and null rest) command)
            (stack (ss) (() ss))))
        body)

  ;; cons (pushes a pair to the top of the stack)
  (eval (g const
           ((do (command) (rest))
            (command (and cons rest) command)
            (stack (s1 s2 ss) ((s1 ys) ss))
            (s1 s1 s1)
            (s2 (ys) s2)))
        body)

  ;; car
  (eval (g const
           ((do (command) (rest))
            (command (and car rest) command)
            (stack (s1 ss) (x ss))
            (s1 (x xs) s1)
            (x x x)))
        body)

  ;; cdr (replaces stack's top element by cdr children of that element)
  (eval (g const
           ((do (command) (rest))
            (command (and cdr rest) command)
            (stack (s1 ss) ((xs) ss))
            (s1 (x xs) s1)
            (x x x)))
        body)

  ;; set (modifies the top of the stack)
  (eval (g const
           ((do (command) (rest))
            (command (and set rest) command)
            (stack (s1 s2 ss) (s1 ss))
            (s1 (xs) (ys))
            (s2 (ys) s2)))
        body)

  ;; push
  (eval (g const
           ((do (command) (rest))
            (command (and push-expr rest) command)
            (push-expr (push v) push-expr)
            (v (x) v)
            (stack (ss) (x ss))
            (x x x)))
        body)

  ;; pop
  (eval (g const
           ((do (command) (rest))
            (command (and pop-expr rest) command)
            (pop-expr (pop v) pop-expr)
            (v (cs) (s1))
            (stack (s1 ss) (ss))
            (s1 s1 s1)))
        body)

  ;; null?
  (eval (g const
           ((do (command) (then))
            (command (if null? then else) command)
            (stack (s1 ss) (ss))
            (then then then)
            (else else else)
            (s1 s1 s1)))
        (eval (g const
                 ((do (command) (else))
                  (command (if null? then else) command)
                  (stack (s1 ss) (ss))
                  (s1 (x xs) s1)
                  (then then then)
                  (else else else)
                  (x x x)))
              body))

  ;; eq?
  (eval (g const
           ((do (command) (else))
            (command (if eq? then else) command)
            (stack (s1 s2 ss) (ss))
            (then then then)
            (else else else)
            (s1 s1 s1)
            (s2 s2 s2)))
        (eval (g const
                 ((do (command) (then))
                  (command (if eq? then else) command)
                  (stack (s1 s1 ss) (ss))
                  (s1 s1 s1)
                  (then then then)
                  (else else else)))
              body))

  ;; progn
  (eval (g (and progn)
           ((g
             (progn x1 x2 x3 xs)
             (and x1 (progn x2 x3 xs)))
            (x1 x1 x1)
            (x2 x2 x2)
            (x3 x3 x3)))
        start)
  (eva1 (g (and progn)
           ((g
             (progn x1 x2)
             (and x1 x2))))
        start)

  )
