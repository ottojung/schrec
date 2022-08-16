
;; if blocks are swaped, then the answer is different
(eva1 (((+ - *) a
        (g + c)
        (g - c))
       ((+ - *) g
        (a + b)
        (a * b)))
      (let ((body ((body + 2) + 3)))
        body))
