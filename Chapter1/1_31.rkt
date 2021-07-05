#lang eopl

(define leaf
  (lambda (num) num))

(define interior-node
  (lambda (name lson rson)
    (list name lson rson)))

(define leaf?
  (lambda (btree)
    (integer? btree)))

(define lson
  (lambda (btree)
    (cadr btree)))

(define rson
  (lambda (btree)
    (caddr btree)))

(define (contents-of btree)
  (if (leaf? btree)
      btree
      (car btree)))
      