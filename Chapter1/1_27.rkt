#lang eopl

(define flatten
  (lambda (slist)
    (if (null? slist)
        '()
        (let ((head (car slist))
              (rest (flatten (cdr slist))))
          (if (symbol? head)
              (cons head rest)
              (append (flatten head) rest))))))
              