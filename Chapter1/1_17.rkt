#lang eopl

(define down
  (lambda (lst)
    (if (null? lst)
        '()
        (cons
         (cons (car lst) '())
         (down (cdr lst))))))
         