(define (mark-leaves-with-red-depth btree)
  (mark-leaves-with-red-depth-from btree 0))

(define (mark-leaves-with-red-depth-from btree n)
  (cond
    ((leaf? btree) n)
    ((eqv? (contents-of btree) 'red)
     (interior-node
      (contents-of btree)
      (mark-leaves-with-red-depth-from (lson btree) (+ n 1))
      (mark-leaves-with-red-depth-from (rson btree) (+ n 1))))
    (else
     (interior-node
      (contents-of btree)
      (mark-leaves-with-red-depth-from (lson btree) n)
      (mark-leaves-with-red-depth-from (rson btree) n)))))
      