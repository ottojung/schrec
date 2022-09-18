
;; state test 5 / with noop rewrite (2)
(let ((switch (off)))
  (eva1 (g (switch off on)
           ((switch (off) (on))
            (switch r r)))
        (body)))
