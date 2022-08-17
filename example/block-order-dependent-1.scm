
;; if blocks are swaped, then the answer is different
(eva1 g (((+ - *) g
        (a + b)
        (a * b))
       ((+ - *) a
        (g + c)
        (g - c)))
      (let ((body ((body + 2) + 3)))
        body))
