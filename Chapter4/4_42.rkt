(let-exp (var exp body)
    (let ((val (newref (a-thunk exp env))))
          (value-of body
                    (extend-env var val env))))
                    