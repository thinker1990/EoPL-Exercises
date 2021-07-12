(define-datatype expval expval?
  (num-val
   (num number?)))

(define (value-of exp env)
  (cases expression exp
    (const-exp (num) (num-val num))
    (var-exp (var) (apply-env env var))
    (diff-exp (exp1 exp2)
              (let ((val1 (value-of exp1 env))
                    (val2 (value-of exp2 env)))
                (let ((num1 (expval->num val1))
                      (num2 (expval->num val2)))
                  (num-val (- num1 num2)))))
    (zero?-exp (exp1)
               (let ((val1 (value-of exp1 env)))
                 (let ((num1 (expval->num val1)))
                   (if (zero? num1)
                       (num-val 1)
                       (num-val 0)))))
    (if-exp (exp1 exp2 exp3)
            (let ((val1 (value-of exp1 env)))
              (if (zero? (expval->num val1))
                  (value-of exp3 env)
                  (value-of exp2 env))))
    (let-exp (val exp1 body)
             (let ((val1 (value-of exp1 env)))
               (value-of body
                         (extend-env var val1 env))))))
