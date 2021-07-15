;; When we are creating the desired recursive closure, 
;; we need an environment containing the closure, 
;; but we can not create the environment directly because we need the closure in order to create the environment. 
;; So we delay the creation of the closure in the environment so that we can create the environment without a closure. 
;; Then, when we need to use the closure, we create it by calling proc-val.
