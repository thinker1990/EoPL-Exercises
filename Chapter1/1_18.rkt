#lang eopl

(define swapper
  (lambda (s1 s2 slist)
    (if (null? slist)
        '()
        (let ((head (car slist))
              (rest (swapper s1 s2 (cdr slist))))
          (cond
            ((eqv? s1 head) (cons s2 rest))
            ((eqv? s2 head) (cons s1 rest))
            ((symbol? head) (cons head rest))
            (else (cons (swapper s1 s2 head) rest)))))))
            