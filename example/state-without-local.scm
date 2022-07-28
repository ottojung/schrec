
;; state test 4 / without local rewrite
(let ((switch (off)))
  (eval (((switch off on) switch
          (off)
          (on)))
        (body)))
