#lang eopl

(define number-elements
  (lambda (lst)
    (if (null? lst)
        '()
        (g (list 0 (car lst))
           (number-elements (cdr lst))))))

(define (g head rest)
  (if (null? rest)
      (cons head '())
      (let ((next (car rest)))
        (cons head
              (g (cons (+ (car head) 1) (cdr next))
                 (cdr rest))))))
