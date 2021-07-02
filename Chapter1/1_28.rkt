#lang eopl

(define merge
  (lambda (loi1 loi2)
    (cond
      ((null? loi1) loi2)
      ((null? loi2) loi1)
      (else (let ((h1 (car loi1))
              (h2 (car loi2))
              (t1 (cdr loi1))
              (t2 (cdr loi2)))
          (if (< h1 h2)
              (cons h1 (merge t1 loi2))
              (cons h2 (merge loi1 t2))))))))
              