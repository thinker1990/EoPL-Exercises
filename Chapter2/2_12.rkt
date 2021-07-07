#lang eopl

(define (empty-stack)
  (lambda (msg)
    (eqv? msg 'empty?)))

(define (push e stk)
  (lambda (cmd)
    (cond
      ((eqv? cmd 'top) e)
      ((eqv? cmd 'pop) stk)
      ((eqv? cmd 'empty?) #f))))

(define (empty-stack? stk)
  (stk 'empty?))

(define (top stk)
  (stk 'top))

(define (pop stk)
  (stk 'pop))
  