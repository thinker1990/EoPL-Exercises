;; 1. ref: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-3
;; Proof
;;   ∀n∈N, let S be the set of all representations of ⌈n⌉. Then, ∀x∈S, we can always construct S′⊆S using the following generation rules:
;;   x∈S
;;   y∈S
;;   ---------------------------
;;   (diff x (diff (one) (one)))
;;   Apparently, we have |S′|=∞. Thus |S|=∞.
;; Q.E.D.

;; 2. 
(define (zero)
  (list 'diff '(one) '(one)))

(define (interpret n)
  (if (eqv? (car n) 'one)
      1
      (- (interpret (cadr n))
         (interpret (caddr n)))))

(define (is-zero? n)
  (zero? (interpret n)))

(define (predecessor n)
  (list 'diff n '(one)))

(define (successor n)
  (list 'diff n (predecessor (zero))))

;; 3.
(define (diff-tree-plus x y)
  (list 'diff x (list 'diff (zero) y)))
