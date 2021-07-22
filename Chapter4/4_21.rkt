(setdynamic-exp (var exp body)
                (let ((v (value-of exp env))
                      (ref (apply-env env var))
                      (value (deref (apply-env env var))))
                  (begin
                    (setref! ref v)
                    (let ((res (value-of body env)))
                      (setref! ref value)
                      res))))
                      