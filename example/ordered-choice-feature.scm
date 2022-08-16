
(let ((const (nil if 1 2 3 eva1 apply eva1-or true false ans1 ans2)))
  (eva1 ((const g
                (apply eva1-or
                       ((rule1-and-0) (rule2-and-0))
                       body)
                (eva1
                 (((fix) fix x (nil))
                  ((turn 1 2 3) turn x (1)))
                 (eva1
                  (((fix) g fix g)
                   ((turn 1 2 3) turn (2) (3))
                   rule-2-and-0)
                  (eva1
                   (((fix) g fix g)
                    ((turn 1 2 3) turn (1) (2))
                    rule-1-and-0
                    ((turn 1 2 3) turn  x  (3)))
                   (eva1
                    ((const g x g)
                     ((nil fix) fix (nil) (x)))
                    body))))))

        (apply eva1-or
               (((const g (if false a b) b))
                ((const g (if x a b) a)))

               (if true ans1 ans2))))
