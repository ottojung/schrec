
;; state test 4 / without local rewrite
(let ((switch (off)))
  (eva1 g (((switch off on) switch
          (off)
          (on)))
        (body)))
