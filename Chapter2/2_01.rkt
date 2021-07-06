#lang eopl

(define N 16)

(define zero
  (lambda () '(0)))

(define (is-zero? n)
  (and (zero? (car n))
       (null? (cdr n))))

(define (successor n)
  (let ((l-sign (car n))
        (rest (cdr n)))
    (if (= l-sign (- N 1))
        (if (null? rest)
            (list 0 1)
            (cons 0 (successor rest)))
        (cons (+ 1 l-sign) rest))))

(define (predecessor n)
  (let ((l-sign (car n))
        (rest (cdr n)))
    (if (zero? l-sign)
        (if (and (= (car rest) 1) (null? (cdr rest)))
            (list 15)
            (cons 15 (predecessor rest)))
        (cons (- l-sign 1) rest))))

(define (factorial n)
  (if (is-zero? n)
      '(1)
      (mul n (factorial (predecessor n)))))

(define (mul x y)
  (if (is-zero? x)
      (zero)
      (plus (mul (predecessor x) y) y)))

(define (plus x y)
  (if (is-zero? x)
      y
      (plus (predecessor x) (successor y))))


;; The larger the argument is, the longer the execution time is.
;; This is because of inherent time complexity of factorial.

;; The larger the base is, the shorter the execution time is.
;; Because larger base takes fewer bigits to represent a given number.
