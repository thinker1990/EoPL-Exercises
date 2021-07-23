(define array?
    (lambda (x)
      (reference? x)))

(define make-array
  (lambda (count value)
    (letrec ((do-alloc
	      (lambda (count)
		(if (> count 0)
		    (let ((new (newref value)))
		      (do-alloc (- count 1)))))))
      (let ((first (newref value)))
	(do-alloc (- count 1))
	first))))

(define array-at
  (lambda (array pos)
    (deref (+ array pos))))

(define array-set!
  (lambda (array pos val)
    (setref! (+ array pos) val)))
    