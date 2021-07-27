let x = 0
in let f = proc (y)
             begin y;
                   y
             end
   in (f begin set x = -(x, -1);
               x
         end)

;; The program above should produce 1 in call-by-need and 2 in call-by-name.
