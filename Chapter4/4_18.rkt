(letrec-exp (p-names b-vars p-bodies letrec-body)
            (value-of
             letrec-body
             (extend-env-rec* p-names b-vars p-bodies env)))
             