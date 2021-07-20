(value-of exp1 ρ σ0) = (val1, σ1)
---------------------------------
(value-of (begin-exp exp1 '()) ρ σ0) = (val1, σ1)
(value-of (begin-exp exp1 (cons exp2 exps)) ρ σ0) = (value-of (begin-exp exp2 exps) ρ σ1)
