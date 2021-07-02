#lang eopl

(define sort/predicate
  (lambda (pred loi)
    (cond
      ((null? loi) '())
      ((null? (cdr loi)) loi)
      (else (merge
             pred
             (list (car loi))
             (sort/predicate pred (cdr loi)))))))

(define merge
  (lambda (pred loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      (else (let ((h1 (car loi1))
              (h2 (car loi2))
              (t1 (cdr loi1))
              (t2 (cdr loi2)))
          (if (pred h1 h2)
              (cons h1 (merge pred t1 loi2))
              (cons h2 (merge pred loi1 t2))))))))
              