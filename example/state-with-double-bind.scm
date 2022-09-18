
;; state test 3 / with double bind
(let ((switch (off)))
  (eva1 (g (switch off on)
           ((g (x) (x (x)))
            (switch (off) (on))
            (g r r)))
        (body)))
