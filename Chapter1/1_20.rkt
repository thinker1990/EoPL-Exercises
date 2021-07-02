#lang eopl

(define count-occurrences
  (lambda (s slist)
    (if (null? slist)
        0
        (let ((head (car slist))
              (rest (count-occurrences s (cdr slist))))
          (cond
            ((eqv? s head) (+ 1 rest))
            ((symbol? head) rest)
            (else (+ (count-occurrences s (car slist)) rest)))))))
            