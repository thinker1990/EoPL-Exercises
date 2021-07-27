(define value-of-operand
  (lambda (exp env)
    (cases expression exp
      [const-exp (num) (newref (num-val num))]
      [var-exp (var) (apply-env env var)]
      [proc-exp (var body) (newref (proc-val (procedure var body env)))]
      [else (newref (a-thunk exp env))])))
      