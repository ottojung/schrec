
;; state test 6 / with noop rewrite (3)
(let ((switch (off)))
  (eval (((switch off on) switch
          (off)
          (on))
         ((switch) switch switch switch))
        (body)))
