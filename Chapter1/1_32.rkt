(define (double-tree btree)
  (if (leaf? btree)
      (* 2 btree)
      (interior-node
       (contents-of btree)
       (double-tree (lson btree))
       (double-tree (rson btree)))))
       