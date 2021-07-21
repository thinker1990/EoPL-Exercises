;; ref: https://github.com/chenyukang/eopl/blob/master/ch4/12.scm

(define value-of
  (lambda (exp env store)
    (cases expression exp
           (const-exp (num)
		      (an-answer (num-val num) store))
           (var-exp (var)
		    (an-answer (apply-env env var)
			    store))

	   (diff-exp (exp1 exp2)
		     (cases answer (value-of exp1 env store)
			    (an-answer (val1 new-store)
				       (let ((val2 (value-of exp2 env store)))
					 (cases answer val2
						(an-answer (val2 new-store)
							   (let ((v1 (expval->num val1))
								 (v2 (expval->num val2)))
							     (an-answer
							      (num-val (- v1 v2))
							      new-store))))))))

           (zero?-exp (exp1)
		      (cases answer (value-of exp1 env store)
			     (an-answer (val new-store)
					(if (zero? (expval->num val))
					    (an-answer (bool-val #t) new-store)
					    (an-answer (bool-val #f) new-store)))))
           (if-exp (exp1 exp2 exp3)
		   (cases answer (value-of exp1 env store)
			  (an-answer (val new-store)
				     (if (expval->bool val)
					 (value-of exp2 env new-store)
					 (value-of exp3 env new-store)))))

           (let-exp (var exp1 body)
		    (cases answer (value-of exp1 env store)
			   (an-answer (val new-store)
				      (value-of body
						(extend-env var val env)
						new-store))))
           (proc-exp (var body)
                     (an-answer (proc-val (procedure var body env))
				store))

           (call-exp (rator rand)
		     (cases answer (value-of rator env store)
			    (an-answer (proc-exp new-store)
				       (cases answer (value-of rand env store)
					      (an-answer (rands new-store)
							 (let ((proc (expval->proc proc-exp))
							       (args rands))
							   (apply-procedure proc args store)))))))

           (letrec-exp (p-names b-vars p-bodies letrec-body)
                       (value-of letrec-body
                                 (extend-env-rec* p-names b-vars p-bodies env) store))

           (begin-exp (exp1 exps)
                      (letrec
                          ((value-of-begins
                            (lambda (e1 es store)
                              (let ((v1 (value-of e1 env store)))
                                (if (null? es)
                                    v1
                                    (value-of-begins (car es) (cdr es) store))))))
                        (value-of-begins exp1 exps store)))

           (newref-exp (exp1)
		       (cases answer (value-of exp1 env store)
			      (an-answer (val new-store)
					 (an-answer (ref-val (newref val))
						    new-store))))

           (deref-exp (exp1)
		      (cases answer (value-of exp1 env store)
			     (an-answer (v1 new-store)
					(let ((ref1 (expval->ref v1)))
					  (an-answer (deref ref1) new-store)))))

	   (setref-exp (exp1 exp2)
		       (cases answer (value-of exp1 env store)
			      (an-answer (v1 new-store)
					 (cases answer (value-of exp2 env store)
						(an-answer (v2 new-store)
							   (let ((ref1 (expval->ref v1)))
							     (begin
							       (setref! ref1 v2)
							       (an-answer (num-val 1) new-store))))))))
           )))
