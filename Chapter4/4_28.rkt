(value-of exp1 ρ σ0) = (val1, σ1)
(value-of exp2 ρ σ1) = (val2, σ2)
----------------------------------------------------------------------------------------------
(value-of (newpair-exp exp1 exp2) ρ σ0) = ((mutpair-val (a-pair l1 l2)), [l2=val2][l1=val1]σ2)
