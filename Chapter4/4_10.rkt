(begin-exp (exps)
           (cond
             ((null? exps)
              '())
             ((null? (cdr exps))
              (value-of (car exps) env))
             (else
              (begin
                (value-of (car exps) env)
                (value-of (begin-exp (cdr exps)) env)))))
                