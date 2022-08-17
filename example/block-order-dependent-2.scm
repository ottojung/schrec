
;; if blocks are swaped, then the answer is different
(eva1 g (((+ - *) a
        (g + c)
        (g - c))
       ((+ - *) g
        (a + b)
        (a * b)))
      (let ((body ((body + 2) + 3)))
        body))
