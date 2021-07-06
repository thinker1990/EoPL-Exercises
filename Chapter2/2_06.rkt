#lang eopl

(define (empty-env)
  '(() ()))

(define (extend-env var val env)
  (let ((vars (car env))
        (vals (cadr env)))
    (list (cons var vars)
          (cons val vals))))

(define (apply-env env var)
  (let ((vars (car env))
        (vals (cadr env)))
    (cond
      ((null? vars) (report-no-binding-found var))
      ((eqv? (car vars) var) (car vals))
      (else (apply-env (list (cdr vars) (cdr vals)) var)))))

(define report-no-binding-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))


;; see: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-6
