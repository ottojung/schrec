
(let ((const (>> << HALT NEWSTATE MOVE _ 0 1 2 3 4 5 6 7 8 9 q0 q1 q2 q3 q4 q5 q6 q7 q8 q9))
      (tape-left  (_ _ _ _))
      (head (_))
      (tape-right (0 0 0 1 1 1 1 _ _ _))
      (state (q0))
      (action (MOVE >>))
      )

  (eval (g const
           ((action (MOVE >>) (NEWSTATE))
            (tape-left  (xs x) (xs x h))
            (head (h) (y))
            (tape-right (y ys) (ys _))
            (x x x)
            (y y y)))
        body)

  (eval (g const
           ((action (MOVE <<) (NEWSTATE))
            (tape-left  (xs x) (_ xs))
            (head (h) (x))
            (tape-right (y ys) (h y ys))
            (x x x)
            (y y y)))
        body)


  ;; Transition relation:

  (eva1 (g const
           ((action (NEWSTATE) (MOVE >>))
            (head (0) (1))
            (state (q0) (q0))))
        body)

  (eva1 (g const
           ((action (NEWSTATE) (MOVE >>))
            (head (1) (0))
            (state (q0) (q1))))
        body)

  (eva1 (g const
           ((action (NEWSTATE) (MOVE >>))
            (head (1) (0))
            (state (q1) (q1))))
        body)

  (eva1 (g const
           ((action (NEWSTATE) (HALT))
            (head (_) (_))
            (state (q1) (HALT))))
        body)

  )
