
;; state test 2 / with noop rewrite
(let ((switch (off)))
  (eva1 (((switch off on) switch
          (off)
          (on))
         (() g r r))
        (body)))
