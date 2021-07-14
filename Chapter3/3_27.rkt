(call-exp (rator rand)
    (let ((proc (expval->proc (value-of rator env)))
          (arg (value-of rand env)))
    (display "Enter procedure")
    (apply-procedure proc arg)
    (display "Exit procedure")))
    