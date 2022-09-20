
;; another state example
(let ((switch (off)))
  (eval (g (off on)
           ((switch (off) (on))))
        body))
