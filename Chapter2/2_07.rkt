;; ref: https://eopl3.readthedocs.io/en/latest/chapter-02.html#exercise-2-7

(define (apply-env env search-var)
  (let apply-env-impl [(env* env)
                       (search-var* search-var)]
    (cond [(eqv? (car env*) 'empty-env)
           (report-no-binding-found search-var* env)]
          [(eqv? (car env*) 'extend-env)
           (let [(saved-var (cadr env*))
                 (saved-val (caddr env*))
                 (saved-env (cadddr env*))]
             (if (eqv? search-var* saved-var)
               saved-val
               (apply-env saved-env search-var*)))]
          [else
            (report-invalid-env env*)])))

(define (report-no-binding-found search-var env)
  (eopl:error 'apply-env "No binding for ~s in environment ~s" search-var env))
  