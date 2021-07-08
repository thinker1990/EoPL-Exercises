#lang eopl

(define-datatype stack stack?
  (empty-stack)
  (a-stack
   (top always?)
   (rest stack?)))

(define (empty-stack? stk)
  (cases stack stk
    (empty-stack () #t)
    (a-stack (top rest) #f)))

(define (push e stk)
  (a-stack e stk))

(define (pop stk)
  (cases stack stk
    (empty-stack () stk)
    (a-stack (top rest) rest)))

(define (top stk)
  (cases stack stk
    (empty-stack () '())
    (a-stack (top rest) top)))
