#lang eopl

(define (number->bintree n)
  (list n '() '()))

(define (current-element tree)
  (car tree))

(define (move-to-left tree)
  (cadr tree))

(define (move-to-right tree)
  (caddr tree))

(define (at-leaf? tree)
  (null? tree))

(define (insert-to-left n tree)
  (let ((cur (current-element tree))
        (left (move-to-left tree))
        (right (move-to-right tree)))
    (list
     cur
     (list n left '())
     right)))

(define (insert-to-right n tree)
  (let ((cur (current-element tree))
        (left (move-to-left tree))
        (right (move-to-right tree)))
    (list
     cur
     left
     (list n right '()))))
