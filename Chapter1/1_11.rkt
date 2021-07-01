;; Because subst recurs on smaller substructure. 
;; We can replace the call to subst-in-s-exp with the body of subst-in-s-exp, 
;; then subst becomes a normal recursive on a smaller substructure.
