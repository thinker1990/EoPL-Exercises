#lang eopl

(define invert
  (lambda (lst)
    (if (null? lst)
        '()
        (cons
         (invert-2-list (car lst))
         (invert (cdr lst))))))

(define invert-2-list
  (lambda (list)
    (cons
     (cadr list)
     (cons (car list) '()))))
     