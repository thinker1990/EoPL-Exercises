(value-of exp1 ρ σ0) = (val1, σ1)
---------------------------------
(value-of (zero?-exp exp1) ρ σ0) = (⌈zero? (expval->bool val1)⌉, σ1)
