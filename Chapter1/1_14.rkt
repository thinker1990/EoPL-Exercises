;; Since 0 ≤ n < length(v), we know that length(v) is at least 1, so that v contains at least one element. We prove partial-vector-sum is correct by induction over n.

;; Base case: if n equals to 0, (partial-vector-sum v n) equals to (vector-ref v 0), which equals to v0, the claim holds.

;; Inductive case: if n ≠ 0, (partial-vector-sum v n) equals to (add (vector-ref v n) (partial-vector-sum v (- n 1))), 
;; which equals to vk+∑i=0..k−1 vi, which equals to ∑i=0..k vi, the claim holds.
