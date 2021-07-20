(value-of (list-exp '())) = (empty-list)

(value-of exp1 ρ σ0) = (val1, σ1)
(value-of (list-exp exps) ρ σ1) = (val2, σ2)
--------------------------------------------
(value-of (list-exp (cons exp1 exps)) ρ σ0) = ((pair-val val1 val2), σ2)
