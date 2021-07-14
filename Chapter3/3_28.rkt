(define-datatype proc proc?
    (procedure
        (var identifier?)
        (body expression?)))

(define apply-procedure
    (lambda (proc1 val env)
        (cases proc proc1
            (procedure (var body)
            (value-of body (extend-env var val env))))))

(proc-exp (var body)
    (proc-val (procedure var body)))

(call-exp (rator rand)
    (let ((proc (expval->proc (value-of rator env)))
          (arg (value-of rand env)))
    (apply-procedure proc arg env)))
