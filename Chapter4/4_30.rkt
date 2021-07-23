;; ref: https://github.com/chenyukang/eopl/blob/master/ch4/30.scm

(define-datatype array array?
  (array-v
   (header reference?)
   (length integer?)))


(define make-array
  (lambda (count value)
    (letrec ((do-alloc
	      (lambda (count)
		(if (> count 0)
		    (let ((new (newref value)))
		      (do-alloc (- count 1)))))))
      (let ((first (newref value)))
	(do-alloc (- count 1))
	(array-v first count)))))

;; index check for array
(define array-chk
  (lambda (arr pos)
    (cases array arr
	   (array-v (header count)
		    (if (>= pos count)
			(error "index out of range for array")
			#t)))))
(define array-at
  (lambda (arr pos)
    (if (array-chk arr pos)
	(cases array arr
	       (array-v (header count)
			(deref (+ header pos)))))))

(define array-set!
  (lambda (arr pos val)
    (if (array-chk arr pos)
	(cases array arr
	       (array-v (header count)
			(setref! (+ header pos) val))))))

(define array-length
  (lambda (arr)
    (cases array arr
	   (array-v (header count)
		    count))))
