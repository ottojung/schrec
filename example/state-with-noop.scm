
;; state test 2 / with noop rewrite
(let ((switch (off)))
  (eval (((switch off on) switch
          (off)
          (on))
         (() g r r))
        (body)))
