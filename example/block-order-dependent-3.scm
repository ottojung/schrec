
;; if blocks are swaped, then the answer is different
(let ((body ((body + 2) + 3)))
  (eva1 g (((+ - *) (body + 1)
            (g + c)
            (g - c))
           ((+ - *) g
            (a + b)
            (a * b)))
        body))