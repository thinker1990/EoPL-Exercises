(define-datatype environment environment?
    (empty-env)
    (extend-env
        (var identifier?)
        (val expval?)
        (env environment?))
    (extend-env-rec
        (p-names (list-of identifier?))
        (b-vars (list-of identifier?)) 
        (bodys (list-of expression?))
        (env environment?)))

(define apply-env
    (lambda (env search-var)
        (cases environment env
            (empty-env ()
                (report-no-binding-found search-var))
            (extend-env (saved-var saved-val saved-env)
                (if (eqv? saved-var search-var)
                    saved-val
                    (apply-env saved-env search-var)))
            (extend-env-rec (p-names b-vars p-bodys saved-env)
                (if (null? p-names)
                    (apply-env saved-env search-var)
                    (let ((var (find-var search-var p-names b-vars))
                          (body (find-body search-var p-names p-bodys))) 
                        (proc-val (procedure var body env))))))))
