(letref-exp (var val body)
		       (cases expression val
			      (var-exp (_var)
				       (value-of body
						 (extend-env var (apply-env env _var) env)))
			      (else
			       (value-of body
					 (extend-env var
						     (newref (value-of val env))
						     env)))))
                             