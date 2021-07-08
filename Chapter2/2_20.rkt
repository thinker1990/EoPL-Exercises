#lang eopl

(define (number->bintree n)
  (cons (list n '() '()) '()))

(define (current-element tree)
  (car (car tree)))

(define (move-to-left tree)
  (let* ([current (car tree)]
         [value (car current)]
         [left (cadr current)]
         [right (caddr current)]
         [parent (cdr tree)])
    (cons left
          (cons (list value 'right right)
                parent))))

(define (move-to-right tree)
  (let* ([current (car tree)]
         [value (car current)]
         [left (cadr current)]
         [right (caddr current)]
         [parent (cdr tree)])
    (cons right
          (cons (list value 'left left)
                parent))))

(define (at-leaf? tree)
  (null? (car tree)))

(define (insert-to-left n tree)
  (let* ([current (car tree)]
         [value (car current)]
         [left (cadr current)]
         [right (caddr current)]
         [parent (cdr tree)])
    (cons (list value (list n left '()) right)
          parent)))

(define (insert-to-right n tree)
  (let* ([current (car tree)]
         [value (car current)]
         [left (cadr current)]
         [right (caddr current)]
         [parent (cdr tree)])
    (cons (list value left (list n '() right))
          parent)))

(define (move-up tree)
  (let* ([current (car tree)]
         [parents (cdr tree)]
         [parent (car parents)]
         [p-value (car parent)]
         [p-branch (cadr parent)]
         [p-son (caddr parent)]
         [rest (cdr parents)])
    (if (eqv? p-branch 'left)
        (cons (list p-value p-son current) rest)
        (cons (list p-value current p-son) rest))))

(define (at-root? tree)
  (null? (cdr tree)))
