
;; state test 5 / with noop rewrite (2)
(let ((switch (off)))
  (eval (((switch off on) switch
          (off)
          (on))
         ((switch) switch r r))
        (body)))
