
;; if blocks are swaped, then the answer is different
(let ((body ((body + 2) + 3)))
  (eva1 (g (+ - *)
           ((g (a + b) (a * b))
            (a (g + c) (g - c))))
        body))
