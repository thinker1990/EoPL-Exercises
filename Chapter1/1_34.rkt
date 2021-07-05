(define (path n tree)
  (if (null? tree)
      '()
      (let ((val (car tree)))
        (cond
          ((= n val) '())
          ((< n val) (cons 'left (path n (lson tree))))
          (else (cons 'right (path n (rson tree))))))))
          