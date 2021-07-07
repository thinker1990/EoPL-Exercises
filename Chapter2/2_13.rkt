#lang eopl

;; empty-env : () → Env
(define empty-env
  (lambda ()
    (cons (lambda () #t)
          (lambda (search-var)
            (report-no-binding-found search-var)))))

;; extend-env : Var × SchemeVal × Env → Env
(define extend-env
  (lambda (saved-var saved-val saved-env)
    (cons (lambda () #f)
          (lambda (search-var)
            (if (eqv? search-var saved-var)
                saved-val
                (apply-env saved-env search-var))))))

;; apply-env : Env × Var → SchemeVal
(define apply-env
  (lambda (env search-var)
    ((cdr env) search-var)))

(define (empty-env? env)
  ((car env)))

(define report-no-binding-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))
    