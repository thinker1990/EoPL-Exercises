(value-of exp1 ρ σ0) = (val1, σ1)
(value-of exp2 ρ σ1) = (val2, σ2)
---------------------------------
(value-of (call-exp exp1 exp2) ρ σ0) = (apply-procedure (expval->proc val1) val2 σ2)
