(call-exp (rator rands)
		     (let ((proc (expval->proc (value-of rator env)))
			   (args (value-of-operands rands env)))
		       (apply-procedure proc args)))
