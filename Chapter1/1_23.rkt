#lang eopl

(define list-index
  (lambda (pred lst)
    (list-index-from pred lst 0)))

(define list-index-from
  (lambda (pred lst n)
    (if (null? lst)
        #f
        (if (pred (car lst))
            n
            (list-index-from pred (cdr lst) (+ n 1))))))
            