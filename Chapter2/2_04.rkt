;; ref: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-4
;; Constructors:
;;   (empty-stack) = ⌈∅⌉
;;   (push ⌈e⌉ ⌈stk⌉) = ⌈stk′⌉, where (top ⌈stk′⌉) = ⌈e⌉

;; Observers:
;;   (empty-stack? ⌈stk⌉) = { #t if stk = ⌈∅⌉, else #f }
;;   (top ⌈stk⌉) = ⌈e⌉, where ⌈stk⌉ = (push ⌈e⌉ (pop ⌈stk⌉))
;;   (pop ⌈stk⌉) = ⌈stk′⌉, where (push (top ⌈stk⌉) ⌈stk′⌉) = ⌈stk⌉
