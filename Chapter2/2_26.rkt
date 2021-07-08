#lang eopl

(define-datatype red-blue-tree rb-tree?
  (leaf-node
   (num integer?))
  (red-node
   (left rb-tree?)
   (right rb-tree?))
  (blue-node
   (sub-nodes (list-of rb-tree?))))

(define (mark-leaves-with-red-depth btree)
  (mark-leaves-with-red-depth-from btree 0))

(define (mark-leaves-with-red-depth-from btree n)
  (cases red-blue-tree btree
    (leaf-node (num) (leaf-node n))
    (red-node (left right)
              (red-node
               (mark-leaves-with-red-depth-from left (+ n 1))
               (mark-leaves-with-red-depth-from right (+ n 1))))
    (blue-node (sub-nodes)
               (blue-node
                (map (lambda (node) (mark-leaves-with-red-depth-from node n))
                     sub-nodes)))))
