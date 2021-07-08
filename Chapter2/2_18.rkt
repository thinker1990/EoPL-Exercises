#lang eopl

(define (number->sequence n)
  (list n '() '()))

(define (current-element seq)
  (car seq))

(define (move-to-left seq)
  (let ((cur (car seq))
        (left (cadr seq))
        (right (caddr seq)))
    (list (car left)
          (cdr left)
          (cons cur right))))

(define (move-to-right seq)
  (let ((cur (car seq))
        (left (cadr seq))
        (right (caddr seq)))
    (list (car right)
          (cons cur left)
          (cdr right))))

(define (insert-to-left n seq)
  (let ((cur (car seq))
        (left (cadr seq))
        (right (caddr seq)))
    (list cur
          (cons n left)
          right)))

(define (insert-to-right n seq)
  (let ((cur (car seq))
        (left (cadr seq))
        (right (caddr seq)))
    (list cur
          left
          (cons n right))))
          