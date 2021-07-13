(define-datatype proc proc?
  (procedure
   (vars (list-of identifier?))
   (body expression?)
   (saved-env environment?)))

(define apply-procedure
  (lambda (proc1 vals)
    (cases proc proc1
      (procedure (vars body saved-env)
                 (value-of body (extend-env* vars vals saved-env))))))

(call-exp (rator rand)
          (let ((proc (expval->proc (value-of rator env)))
                (args (map (lambda (arg) (value-of arg env)) rand)))
            (apply-procedure proc args)))
            