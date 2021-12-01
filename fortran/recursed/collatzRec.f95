      program collatzIt
      !Program for recursively computing 10 smallest ints w/ largest
      ! Collatz sequences less than 5 billion

        
        integer*16 :: i, val, collVal
        integer*16 ::collatz

      !Testing recursive Collatz function        
        collVal = 97
        print *, collatz(collVal)
      end program collatzIt

      recursive integer*16 function collatz( i ) result (val)
      !Recursive version of Collatz function for counting steps of
      !Collatz sequence
      !If input val is even, divides by 2
      !Else, multiplies by 3 and adds 1
  
      !Once number reaches 1, returns count of steps in sequence
        integer*16 :: i
        val = 1
        if (i == 1) then
               val = 0
        else if (mod(i,2) == 0) then
                val = val + collatz(i / 2)        
        else
                val = val + collatz(i * 3 + 1)
        endif       
        end function collatz
