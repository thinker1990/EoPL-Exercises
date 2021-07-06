;; ref: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-2

;; Unary representation
;; Pros:
;;   Fully conforms to the specification, limited by physical memory capacity only.
;;   Simple implementation
;; Cons:
;;   Poor performance
;;   Hardly readable when used to represent large numbers

;; Scheme number representation
;; Pros:
;;   Simple implementation
;;   The representation is easy to read
;;   Good performance (completely decided by the underlying concrete Scheme implementation)
;; Cons:
;;   For Scheme implementations that doesn’t have built-in bignum support, calculation result may overflow, thus doesn’t fully conform to the specification.

;; Bignum representation
;; Pros:
;;   Fully conforms to the specification.
;;   Relatively good performance. Essentially, larger base leads to better performance.
;;   The representation is relatively easier to read
;; Cons:
;;   Depends on a global state (base)
