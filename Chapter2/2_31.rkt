#lang eopl

(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (diff-exp
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))

(define (parse-prefix-exp datum)
  (car (parse-helper datum)))

(define (parse-helper lst)
  (cond
    [(integer? (car lst))
     (cons (const-exp (car lst))
           (cdr lst))]
    [(eqv? (car lst) '-)
     (let* ([op1 (parse-helper (cdr lst))]
            [op2 (parse-helper (cdr op1))])
       (cons (diff-exp (car op1) (car op2))
             (cdr op2)))] ))
             