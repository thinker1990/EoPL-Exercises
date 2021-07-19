(define cond-val
  (lambda (conds acts nameless-env)
    (cond ((null? conds)
	   (error 'cond-val "No conditions got into #t"))
	  ((expval->bool (value-of (car conds) nameless-env))
	   (value-of (car acts) nameless-env))
	  (else
	   (cond-val (cdr conds) (cdr acts) nameless-env)))))
       