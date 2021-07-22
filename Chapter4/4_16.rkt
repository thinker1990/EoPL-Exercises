;; First we allocate a new location for the number 0, then we bind times4 to the location. 
;; After we setting times4 to the procedure, the location pointed by times4 contains the procedure closure. 
;; In the enclosed environment of the procedure, times4 also points to the procedure so the procedure can call itself recursively.
