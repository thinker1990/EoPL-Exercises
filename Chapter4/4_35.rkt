(assign-exp (var exp1)
            (begin
              (setref!
               (apply-env env var)
               (value-of exp1 env))
              (num-val 27)))

(ref-exp (var)
         (apply-env env var))

(deref-exp (var)
           (let ((ref (value-of var env)))
             (deref ref)))

(setref-exp (var val)
            (let ((ref (value-of var env))
                  (_val (value-of val env)))
              (setref! ref _val)))
              