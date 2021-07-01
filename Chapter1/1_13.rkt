#lang eopl

(define subst-in-s-exp
  (lambda (new old sexp)
    (if (symbol? sexp)
        (if (eqv? sexp old) new sexp)
        (subst new old sexp))))

(define subst
  (lambda (new old slist)
    (map (lambda (sexp) (subst-in-s-exp new old sexp))
         slist)))
         