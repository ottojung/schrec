
%run guile

%var get-atom-type

%use (keyword-eval) "./keyword-eval.scm"
%use (keyword-let) "./keyword-let.scm"

(define (get-atom-type atom)
  (cond
   ((eq? keyword-eval atom) 'teval)
   ((eq? keyword-let) 'tlet)
   (else 'regular)))
