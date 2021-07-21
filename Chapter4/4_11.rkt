(list-exp (exps)
          (map
           (lambda (e) (value-of e env))
           exps))
           