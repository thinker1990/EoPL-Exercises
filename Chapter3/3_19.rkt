; ref: https://github.com/svenpanne/EOPL3/blob/master/chapter3/exercise-3-19.rkt

; Note that we do not *replace* proc by letproc, but add the latter.
;
; Expression ::= letproc Identifier (Identifier) = Expression in Expression
;                (letproc-exp (name var proc-body exp-body)
;
; (value-of (letproc-exp name var proc-body exp-body) rho)
; = (value-of exp-body [name=(proc-val (procedure var proc-body rho))] rho)

(letproc-exp (name var proc-body exp-body)
             (let ((p-val (proc-val (procedure var proc-body env))))
               (value-of exp-body (extend-env name p-val env))))
