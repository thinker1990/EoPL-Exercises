#lang eopl

(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))

(define (bintree-sum tree)
  (cases bintree tree
    (leaf-node (num) num)
    (interior-node (key left right)
                   (+ (bintree-sum left)
                      (bintree-sum right)))))

(define (max-interior tree)
  (cases bintree tree
    (leaf-node (num) num)
    (interior-node (key left right)
                   (let ([root-sum (bintree-sum tree)]
                         [left-sum (bintree-sum left)]
                         [right-sum (bintree-sum right)])
                     (cond
                       [(and (>= root-sum left-sum) (>= root-sum right-sum)) key]
                       [(>= left-sum right-sum) (max-interior left)]
                       [else (max-interior right)])))))
