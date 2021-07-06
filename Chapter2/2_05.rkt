#lang eopl

(define (empty-env)
  '())

(define (extend-env var val env)
  (cons (cons var val) env))

(define (apply-env env var)
  (if (null? env)
      (report-no-binding-found var)
      (let ((head (car env)))
        (if (eqv? (car head) var)
            (cdr head)
            (apply-env (cdr env) var)))))

(define report-no-binding-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))
    