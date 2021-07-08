#lang eopl

(define (identifier? e)
  (and (symbol? e)
       (not (eqv? 'lambda e))))
       