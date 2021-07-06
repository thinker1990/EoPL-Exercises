#lang eopl

(define (has-binding? env var)
  (if (null? env)
      #f
      (let ((head (car env)))
        (if (eqv? (car head) var)
            #t
            (has-binding? (cdr env) var)))))
            