;; Yes, the original program in exercise 3.25 works under call-by-need.
;; And the program above will loop infinitely under call-by-value, 
;; because in line 3, (d d) calls d with itself, and when d is called, 
;; it calls its argument x with x, where x is d itself. 
;; So (d d) leads to another call to (d d) which leads to infinite loop.
