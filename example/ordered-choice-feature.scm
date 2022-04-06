
(let ((const (nil if 1 2 3 eval apply eval-or true false ans1 ans2)))
  (eval ((const g
                (apply eval-or
                       ((rule1-and-0) (rule2-and-0))
                       body)
                (eval
                 (((fix) fix x (nil))
                  ((turn 1 2 3) turn x (1)))
                 (eval
                  (((fix) g fix g)
                   ((turn 1 2 3) turn (2) (3))
                   rule-2-and-0)
                  (eval
                   (((fix) g fix g)
                    ((turn 1 2 3) turn (1) (2))
                    rule-1-and-0
                    ((turn 1 2 3) turn  x  (3)))
                   (eval
                    ((const g x g)
                     ((nil fix) fix (nil) (x)))
                    body))))))

        (apply eval-or
               (((const g (if false a b) b))
                ((const g (if x a b) a)))

               (if true ans1 ans2))))
