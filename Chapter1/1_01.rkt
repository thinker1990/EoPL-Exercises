;; 1. {3n + 2 | n ∈ N}
;; top-down: A natural number n is in S if and only if
;;   1. n = 2, or
;;   2. n - 3 ∈ S.
;; buttom-up: Define the set S to be the smallest set contained in N and satisfying the following properties:
;;   1. 2 ∈ S, and
;;   2. if n ∈ S, then n + 3 ∈ S.
;; rules of inference: 
;;   2 ∈ S
;;   n ∈ S
;;   ------------
;;   (n + 3) ∈ S

;; 2. {2n + 3m + 1 | n, m ∈ N}
;; top-down: A natural number n is in S if and only if
;;   1. n = 1, or
;;   2. n - 2 ∈ S, or
;;   3. n - 3 ∈ S.
;; buttom-up: Define the set S to be the smallest set contained in N and satisfying the following properties:
;;   1. 1 ∈ S, and
;;   2. if n ∈ S, then n + 2 ∈ S and n + 3 ∈ S.
;; rules of inference: 
;;   1 ∈ S
;;   n ∈ S
;;   --------------------------
;;   (n + 2) ∈ S, (n + 3) ∈ S

;; 3. {(n, 2n + 1) | n ∈ N}
;; top-down: A pair of natural number (m, n) is in S if and only if
;;   1. (m, n) = (0, 1), or
;;   2. (m - 1, n - 2) ∈ S.
;; buttom-up: Define the set S to be the smallest set contained in N * N and satisfying the following properties:
;;   1. (0, 1) ∈ S, and
;;   2. if (m, n) ∈ S, then (m + 1, n + 2) ∈ S.
;; rules of inference: 
;;   (0, 1) ∈ S
;;   (m, n) ∈ S
;;   ------------
;;   (m + 1, n + 2) ∈ S

;; 4. {(n, n ^ 2) | n ∈ N}
;; top-down: A pair of natural number (m, n) is in S if and only if
;;   1. (m, n) = (0, 0), or
;;   2. (m - 1, n - 2m + 1) ∈ S.
;; buttom-up: Define the set S to be the smallest set contained in N * N and satisfying the following properties:
;;   1. (0, 0) ∈ S, and
;;   2. if (m, n) ∈ S, then (m + 1, n + 2m + 1) ∈ S.
;; rules of inference: 
;;   (0, 0) ∈ S
;;   (m, n) ∈ S
;;   ------------
;;   (m + 1, n + 2m + 1) ∈ S
