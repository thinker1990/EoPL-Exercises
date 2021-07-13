Value of given program is 12.

The procedure of factorial:

let maketimes = proc (maker)
                  proc (x)
                    proc (y)
                      if zero? (x)
                      then 0
                      else -((((maker maker) -(x, 1)) y), -(0, y))
in let times = (maketimes maketimes)
   in let makefact = proc (maker)
                       proc (x)
                         if zero? (x)
                         then 1
                         else ((times x) ((maker maker) -(x, 1)))
      in (makefact makefact)
