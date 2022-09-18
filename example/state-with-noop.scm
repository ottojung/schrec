
;; state test 2 / with noop rewrite
(let ((switch (off)))
  (eva1 (g (switch off on)
           ((switch (off) (on))
            (g r r)))
        (body)))
