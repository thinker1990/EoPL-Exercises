;; In new-ref, length and append take linear time, so new-ref takes linear time.
;; In deref, list-ref take linear time, so deref takes linear time.
;; In setref!, setref-inner loops through the store, which takes linear time, so setref! takes linear time.
