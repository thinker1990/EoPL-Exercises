;; ref: https://github.com/EFanZh/EOPL-Exercises/blob/master/solutions/exercise-3.x-letrec-lang-circular.rkt

(define extend-env-rec
  (lambda (p-names b-vars bodies saved-env)
    (let loop ([p-names p-names]
               [b-vars b-vars]
               [bodies bodies]
               [saved-env saved-env]
               [finalize-envs '()])
      (if (null? p-names)
          (let loop ([finalize-envs finalize-envs])
            (if (null? finalize-envs)
                saved-env
                (begin ((car finalize-envs) saved-env)
                       (loop (cdr finalize-envs)))))
          (let ([vec (make-vector 1)])
            (loop (cdr p-names)
                  (cdr b-vars)
                  (cdr bodies)
                  (extend-env (car p-names) vec saved-env)
                  (cons (lambda (env)
                          (vector-set! vec 0 (proc-val (procedure (car b-vars) (car bodies) env))))
                        finalize-envs)))))))
