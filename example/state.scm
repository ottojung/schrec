
;; state test 1
(let ((switch (off)))
  (eva1 (g (switch off on)
           ((g (x) (x (x)))
            (switch (off) (on))))
        (body)))
