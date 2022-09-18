
;; FIXME: pass this test
;; `xs` is bound to many nodes: to `1` and to `2` and to `3` and to `4`.
;; Thus, the pattern should not match
(eval (g const ((g (xs) xs)))
      (1 2 3 4))
