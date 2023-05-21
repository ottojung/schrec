
(cond-expand
 (guile
  (define-module (test-eval-ordering)
    :use-module ((euphrates assert-equal) :select (assert=))
    :use-module ((euphrates assq-set-value) :select (assq-set-value))
    :use-module ((glisp input) :select (input))
    :use-module ((schrec eval-specialty) :select (eval-specialty))
    :use-module ((schrec find-partially-sorted-eval-likes) :select (find-partially-sorted-eval-likes))
    :use-module ((schrec get-head) :select (get-head))
    :use-module ((schrec list-to-graph) :select (list->graph))
    :use-module ((schrec load-specialty) :select (load-specialty))
    :use-module ((schrec node) :select (node?))
    )))


(use-modules (ice-9 pretty-print))

;; test eval ordering
(let ()
  (define instance
    '((a b c
         (x x (eval-type-1 e1 b1))
         (y y (eval-type-2 e6 (eval-type-1 e7 b7)))
         (eval-type-2 e2
             (d e (eval-type-1 e3
                       (f g
                       (k l (eval-type-2 e4 (i o)))))
            (p x (y n (eval-type-2 e5 z))))))))

  (define eval-likes
    `(eval-type-1 eval-type-2))

  (define load-result
    (for-each
     (lambda (name)
       (load-specialty
        (lambda (input)
          (assq-set-value 'name name (eval-specialty input)))))
     eval-likes))

  (define graph
    (list->graph instance))

  (define found
    (find-partially-sorted-eval-likes graph))

  (define mapped
    (let loop ((x found))
      (cond
       ((node? x)
        ;; x)
        (cadr (get-head 2 x)))
       ;; (list->vector (get-head 2 x)))
       ((pair? x) (map loop x))
       (else x))))

  ;; (display "Partially sorted:\n")
  ;; (pretty-print mapped)
  (assert= '((e5 e4 e7 e1) (e3 e6) (e2)) mapped))
