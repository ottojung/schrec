
;; Evaluator of Lisp code restricted to list operations and `if' keyword.
;; Works on quoted source code, so this is an embedding.
;; Input program is written to the `body' variable.
;; Variables are simply references to nodes, no special "let*" construct for them is needed.
(let ((const (car cdr cons set-car! set-cdr! begin quote eq? null? true false if))
      (var1 (cons (car (cdr (quote (1 2 3 4))))
                  (quote (7 8))))
      (var2 (cdr (quote (1))))
      (body (begin
              (set-car! var1 (quote 9))
              (if (null? var2) (yes var1) no))))
  (eva1 g ((const g
                  (if (begin true) x y)
                  (begin x)))
        body)
  (eva1 g ((const g
                  (if (begin false) x y)
                  (begin x)))
        body)
  (eva1 g ((const g
                  (null? (quote x))
                  (begin true))
           (const x x x))
        (eval g ((const g
                        (null? z)
                        (begin false))
                 (const z (quote (x xs)))
                 (const x x x))
              body))
  (eva1 g ((const g
                  (eq? (quote x) (quote y))
                  (begin false)))
        (eva1 g ((const g
                        (eq? z w)
                        (begin true))
                 (const z (quote x) z)
                 (const w (quote x) w))
              body))
  (eval g ((const g
                  (car (quote (x xs)))
                  (quote x))
           (const x x x))
        body)
  (eval g ((const g
                  (cdr (quote (x xs)))
                  (quote (xs)))
           (const x x x))
        body)
  (eval g ((const g
                  (cons (quote x) (quote (ys)))
                  (quote (x ys)))
           (const x x x))
        body)
  (eval g (let ((sab (quote (x xs)))
                (sa (set-car! sab (quote y))))
            ((const g
                    (begin sa instructions)
                    (begin instructions))
             (const sab sab (quote (y xs)))
             (() sa sa sa)
             (() y y y)
             (() x x x)))
        body)
  (eval g (let ((sdb (quote (x xs)))
                (sd (set-cdr! sdb (quote (ys)))))
            ((const g
                    (begin sd instructions)
                    (begin instructions))
             (const sdb sdb (quote (x ys)))
             (() sd sd sd)
             (() x x x)))
        body)
  (eval g ((const g
                  (begin (begin xs))
                  (begin xs)))
        body)
  (eval g ((const g
                  (begin (quote x))
                  (quote x))
           (() x x x))
        body))
