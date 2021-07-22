(value-of exp1 ρ σ0) = (val1, σ1)
---------------------------------
(value-of (let-exp var exp1 body) ρ σ0) = ((value-of body [ρ(var) = l]ρ [ρ(l) = val1]σ1), [ρ(var) = val1]σ1)
