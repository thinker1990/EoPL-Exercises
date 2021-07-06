#lang eopl

(define (empty-env)
  '())

(define (extend-env var val env)
  (cons (cons (list var) (list val)) env))

(define (apply-env env var)
  (if (null? env)
      (report-no-binding-found var)
      (let* ((head (car env))
             (res (search var head)))
        (if (null? res)
            (apply-env (cdr env) var)
            res))))

(define (search var rib)
  (let ((vars (car rib))
        (vals (cdr rib)))
    (cond
      ((null? vars) '())
      ((eqv? (car vars) var) (car vals))
      (else
       (search var (cons (cdr vars) (cdr vals)))))))

(define (extend-env* vars vals env)
  (cons (cons vars vals) env))

(define report-no-binding-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))
    