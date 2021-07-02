#lang eopl

(define up
  (lambda (lst)
    (if (null? lst)
        '()
        (let ((head (car lst))
              (rest (up (cdr lst))))
          (if (list? head)
              (append head rest)
              (cons head rest))))))
