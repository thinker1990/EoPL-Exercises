;; ref: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-17

(define (var-exp var)
  (cons 'var-exp
        (lambda () var)))

(define (lambda-exp bound-var body)
  (cons 'lambda-exp
        (lambda (field)
          (match field
                 ['bound-var bound-var]
                 ['body body]))))

(define (app-exp rator rand)
  (cons 'app-exp
        (lambda (field)
          (match field
                 ['rator rator]
                 ['rand rand]))))

(define (var-exp? exp)
  (match exp
         [(cons 'var-exp _) #t]
         [_ #f]))

(define (lambda-exp? exp)
  (match exp
         [(cons 'lambda-exp _) #t]
         [_ #f]))

(define (app-exp? exp)
  (match exp
         [(cons 'app-exp _) #t]
         [_ #f]))

(define (lc-exp? exp)
  (or (var-exp? exp)
      (lambda-exp? exp)
      (app-exp? exp)))

(define (var-exp->var exp)
  ((cdr exp)))

(define (lambda-exp->bound-var exp)
  ((cdr exp) 'bound-var))

(define (lambda-exp->body exp)
  ((cdr exp) 'body))

(define (app-exp->rator exp)
  ((cdr exp) 'rator))

(define (app-exp->rand exp)
  ((cdr exp) 'rand))
  