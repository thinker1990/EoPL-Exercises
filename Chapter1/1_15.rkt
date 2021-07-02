#lang eopl
;; duple : Int * SchemeVal -> List
;; usage : (duple n x), return a list of x duplicate n times.
(define duple
  (lambda (n x)
    (if (zero? n)
        '()
        (cons x (duple (- n 1) x)))))
        