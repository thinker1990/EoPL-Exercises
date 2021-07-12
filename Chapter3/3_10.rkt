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
  (var-exp
   (var symbol?))
  (let-exp
   (var symbol?)
   (exp1 expression?)
   (body expression?))
  (cons-exp
   (head expression?)
   (rest expression?))
  (car-exp
   (exp1 expression?))
  (cdr-exp
   (exp1 expression?))
  (null?-exp
   (exp1 expression?))
  (emptylist-exp)
  (list-exp
   (a-list (list-of expression?))))

(define-datatype expval expval?
  (num-val
   (num number?))
  (bool-val
   (bool boolean?))
  (emptylist-val)
  (cons-val
   (head expval?)
   (rest expval?)))

(define (expval->car val)
  (cases expval val
    (cons-val (head rest) head)
    (else (report-expval-extractor-error 'cons val))))

(define (expval->cdr val)
  (cases expval val
    (cons-val (head rest) rest)
    (else (report-expval-extractor-error 'cons val))))

(define (expval->emptylist? val)
  (cases expval val
    (emptylist-val () #t)
    (cons-val (head rest) #f)
    (else (report-expval-extractor-error 'cons-or-emptylist val))))


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
    (let-exp (val exp1 body)
             (let ((val1 (value-of exp1 env)))
               (value-of body
                         (extend-env var val1 env))))
    (cons-exp (head rest)
              (let ((hval (value-of head env))
                    (rval (value-of rest env)))
                (cons-val hval rval)))
    (car-exp (exp1)
             (expval->car (value-of exp1 env)))
    (cdr-exp (exp1)
             (expval->cdr (value-of exp1 env)))
    (null?-exp (exp1)
               (bool-val (expval->emptylist? (value-of exp1 env))))
    (emptylist-exp ()
                   (emptylist-val))
    (list-exp (a-list)
              (if (null? a-list)
                  (emptylist-val)
                  (cons-val (value-of (car a-list) env)
                            (value-of (list-exp (cdr a-list)) env))))
    ))
