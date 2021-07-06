(define (extend-env* vars vals env)
  (if (null? vars)
      env
      (extend-env
       (car vars)
       (car vals)
       (extend-env*
        (cdr vars)
        (cdr vals)
        env))))
        