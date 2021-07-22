(define extend-env*
  (lambda (vars vals env)
    (if (null? vars)
        env
        (extend-env (car vars) (newref (car vals))
                    (extend-env* (cdr vars) (cdr vals) env)))))

(let-exp (vars exps body)
         (value-of body
                   (extend-env*
                    vars
                    (map (lambda (e) (value-of e env)) exps)
                    env)))
                    