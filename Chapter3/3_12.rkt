#lang eopl

(define-datatype expression expression?
  (const-exp
   (num number?))
  (diff-exp
   (exp1 expression?)
   (exp2 expression?))
  (zero?-exp
   (exp1 expression?))
  (if-exp
   (exp1 expression?)
   (exp2 expression?)
   (exp3 expression?))
  (cond-exp
   (clauses (list-of pair?)))
  (var-exp
   (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?))
  )


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
                       (bool-val #t)
                       (bool-val #f)))))
    (if-exp (exp1 exp2 exp3)
            (let ((val1 (value-of exp1 env)))
              (if (expval->bool val1)
                  (value-of exp2 env)
                  (value-of exp3 env))))
    (cond-exp (clauses)
              (if (null? clauses)
                  (report-no-match-cond-error)
                  (let* ((first (car clauses))
                         (rest (cdr clauses))
                         (cond-val (value-of (car first) env)))
                    (if (expval->bool cond-val)
                        (value-of (cadr first) env)
                        (value-of (cond-exp rest) env)))))
    (let-exp (val exp1 body)
             (let ((val1 (value-of exp1 env)))
               (value-of body
                         (extend-env var val1 env))))
    ))
