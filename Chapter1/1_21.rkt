#lang eopl

(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
        '()
        (let ((head (pair-each (car sos1) sos2))
              (rest (product (cdr sos1) sos2)))
          (append head rest)))))

(define pair-each
  (lambda (s lst)
    (if (null? lst)
        '()
        (cons
         (list s (car lst))
         (pair-each s (cdr lst))))))
         