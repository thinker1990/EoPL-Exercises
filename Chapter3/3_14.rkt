#lang eopl

(define-datatype bool-exp bool-exp?
  (true-value)
  (false-value))

(define (value-of-bool-exp exp env)
  (let ((val (value-of exp env)))
    (if (bool-exp? val)
        (expval->bool val)
        (report-error-not-bool))))

(define-datatype expval expval?
  (num-val
   (num number?))
  (bool-val
   (bool bool-exp?)))

(define (to-bool-val val)
  (if val (true-value) (false-value)))

(define (expval->bool exp)
  (cases bool-exp exp
    (true-value () #t)
    (false-value () #f)))

(define-datatype expression expression?
  (const-exp
   (num number?))
  (diff-exp
   (exp1 expression?)
   (exp2 expression?))
  (zero?-exp
   (exp1 expression?))
  (equal?-exp  ;; equal? expression
   (exp1 expression?)
   (exp2 expression?))
  (greater?-exp  ;; greater? expression
   (exp1 expression?)
   (exp2 expression?))
  (less?-exp  ;; less? expression
   (exp1 expression?)
   (exp2 expression?))
  (if-exp
   (exp1 bool-exp?)
   (exp2 expression?)
   (exp3 expression?))
  (var-exp
   (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?)))

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
                   (to-bool-val (zero? num1)))))
    (equal?-exp (exp1 exp2)  ;; value-of equal? expression
              (let ((val1 (value-of exp1 env))
                    (val2 (value-of exp2 env)))
                (let ((num1 (expval->num val1))
                      (num2 (expval->num val2)))
                  (to-bool-val (= num1 num2)))))
    (greater?-exp (exp1 exp2)  ;; value-of greater? expression
              (let ((val1 (value-of exp1 env))
                    (val2 (value-of exp2 env)))
                (let ((num1 (expval->num val1))
                      (num2 (expval->num val2)))
                  (to-bool-val (> num1 num2)))))
    (less?-exp (exp1 exp2)  ;; value-of less? expression
              (let ((val1 (value-of exp1 env))
                    (val2 (value-of exp2 env)))
                (let ((num1 (expval->num val1))
                      (num2 (expval->num val2)))
                  (to-bool-val (< num1 num2)))))
    (if-exp (exp1 exp2 exp3)
            (let ((val1 (value-of-bool-exp exp1 env)))
              (if (expval->bool val1)
                  (value-of exp2 env)
                  (value-of exp3 env))))
    (let-exp (val exp1 body)
             (let ((val1 (value-of exp1 env)))
               (value-of body
                         (extend-env var val1 env))))))
