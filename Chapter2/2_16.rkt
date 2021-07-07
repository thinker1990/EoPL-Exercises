#lang eopl

;; var-exp : Var → Lc-exp
(define (var-exp var) var)

;; lambda-exp : Var × Lc-exp → Lc-exp
(define (lambda-exp var body)
  (list 'lambda var body))

;; app-exp : Lc-exp × Lc-exp → Lc-exp
(define (app-exp rator rand)
  (list rator rand))

;; var-exp? : Lc-exp → Bool
(define (var-exp? exp)
  (symbol? exp))

;; lambda-exp? : Lc-exp → Bool
(define (lambda-exp? exp)
  (and (pair? exp)
       (eqv? (car exp) 'lambda)
       (var-exp? (lambda-exp->bound-var exp))
       (lc-exp? (lambda-exp->body exp))))

;; app-exp? : Lc-exp → Bool
(define (app-exp? exp)
  (and (pair? exp)
       (lc-exp? (app-exp->rator exp))
       (lc-exp? (app-exp->rand exp))))

(define (lc-exp? exp)
  (or (var-exp? exp)
      (lambda-exp? exp)
      (app-exp? exp)))

;; var-exp->var : Lc-exp → Var
(define (var-exp->var exp) exp)

;; lambda-exp->bound-var : Lc-exp → Var
(define (lambda-exp->bound-var exp)
  (cadr exp))

;; lambda-exp->body : Lc-exp → Lc-exp
(define (lambda-exp->body exp)
  (caddr exp))

;; app-exp->rator : Lc-exp → Lc-exp
(define (app-exp->rator exp)
  (car exp))

;; app-exp->rand : Lc-exp → Lc-exp
(define (app-exp->rand exp)
  (cadr exp))
