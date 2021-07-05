(define (number-leaves btree)
  (car (number-leaves-from btree 0)))

(define (number-leaves-from btree n)
  (if (leaf? btree)
      (cons (leaf n) (+ n 1))
      (let* ((lres (number-leaves-from (lson btree) n))
             (rres (number-leaves-from (rson btree) (cdr lres))))
        (cons
         (interior-node
          (contents-of btree)
          (car lres)
          (car rres))
         (cdr rres)))))
         