#lang eopl

(define-datatype environment env?
  (empty-env)
  (extend-env
   (head pair?)
   (rest env?)))

(define (has-binding? env var)
  (cases environment env
    (empty-env () #f)
    (extend-env (head rest)
                (or (eqv? (car head) var)
                    (has-binding? rest var)))))
                    