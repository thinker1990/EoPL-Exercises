;; ref: https://github.com/chenyukang/eopl/blob/master/ch3/39-translator.scm

(define translation-of
  (lambda (exp senv)
    (cases expression exp
	   (const-exp (num) (const-exp num))
	   (diff-exp (exp1 exp2)
		     (diff-exp
		      (translation-of exp1 senv)
		      (translation-of exp2 senv)))

	   (cons-exp (exp1 exp2)
		     (cons-exp
		      (translation-of exp1 senv)
		      (translation-of exp2 senv)))

	   (zero?-exp (exp1)
		      (zero?-exp
		       (translation-of exp1 senv)))

	   (if-exp (exp1 exp2 exp3)
		   (if-exp
		    (translation-of exp1 senv)
		    (translation-of exp2 senv)
		    (translation-of exp3 senv)))

	   (var-exp (var)
		    (nameless-var-exp
		     (apply-senv senv var)))

	   (let-exp (var exp1 body)
		    (nameless-let-exp
		     (translation-of exp1 senv)
		     (translation-of body
				     (extend-senv var senv))))
	   (proc-exp (var body)
		     (nameless-proc-exp
		      (translation-of body
				      (extend-senv var senv))))
	   (call-exp (rator rand)
		     (call-exp
		      (translation-of rator senv)
		      (translation-of rand senv)))

           (emptylist-exp ()
                          (emptylist-exp))

           (car-exp (body)
                    (car-exp (translation-of body senv)))
           (cdr-exp (body)
                    (cdr-exp (translation-of body senv)))
           (null?-exp (exp)
                      (null?-exp (translation-of exp senv)))
           (list-exp (args)
                     (list-exp (map (translate-elm senv) args)))

	   (unpack-exp (vars vals body)
		       (nameless-unpack-exp
			(translation-of vals senv)
			(translation-of body (extend-senv* vars senv))))

	   (else (report-invalid-source-expression exp))
	   )))


;; ref: https://github.com/chenyukang/eopl/blob/master/ch3/39.scm

(define value-of
  (lambda (exp nameless-env)
    (cases expression exp
	   (const-exp (num) (num-val num))

	   (diff-exp (exp1 exp2)
		     (let ((val1
			    (expval->num
			     (value-of exp1 nameless-env)))
			   (val2
			    (expval->num
			     (value-of exp2 nameless-env))))
		       (num-val
			(- val1 val2))))
	   
	   (cons-exp (exp1 exp2)
		     (pair-val 
		      (value-of exp1 nameless-env)
		      (value-of exp2 nameless-env)))

	   (zero?-exp (exp1)
		      (let ((val1 (expval->num (value-of exp1 nameless-env))))
			(if (zero? val1)
			    (bool-val #t)
			    (bool-val #f))))
	   
	   ;;new stuff
	   (emptylist-exp ()
                          (emptylist-val))

           (car-exp (body)
                    (expval-car (value-of body nameless-env)))
           (cdr-exp (body)
                    (expval-cdr (value-of body nameless-env)))
           (null?-exp (exp)
                      (expval-null? (value-of exp nameless-env)))
           (list-exp (args)
                     (list-val (map (apply-elm nameless-env) args)))

	   (if-exp (exp0 exp1 exp2)
		   (if (expval->bool (value-of exp0 nameless-env))
		       (value-of exp1 nameless-env)
		       (value-of exp2 nameless-env)))

	   (call-exp (rator rand)
		     (let ((proc (expval->proc (value-of rator nameless-env)))
			   (arg (value-of rand nameless-env)))
		       (apply-procedure proc arg)))

	   (nameless-var-exp (n)
			     (apply-nameless-env nameless-env n))

	   (nameless-let-exp (exp1 body)
			     (let ((val (value-of exp1 nameless-env)))
			       (value-of body
					 (extend-nameless-env val nameless-env))))

	   (nameless-proc-exp (body)
			      (proc-val
			       (procedure body nameless-env)))

	   (nameless-unpack-exp (vals body)
				(let ((_vals (expval->pair (value-of vals nameless-env))))
				  (value-of body
					    (extend-nameless-env* _vals nameless-env))))
	   (else
	    (error 'value-of
			"Illegal expression in translated code: ~s" exp))

	   )))
       