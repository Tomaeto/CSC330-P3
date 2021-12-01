      program collatzIt
      !Program for iteravely computing 10 smallest ints w/ largest
      ! Collatz sequences less than 5 billion

        
        integer*16 :: i, val, collVal
        integer*16 ::collatz

      !Testing iterative Collatz function        
        collVal = 77031
        print *, collatz(collVal)
      end program collatzIt

      integer*16 function collatz( i ) result (val)
      !Iterative version of Collatz function for counting steps of
      !Collatz sequence
      !If input val is even, divides by 2
      !Else, multiplies by 3 and adds 1
  
      !Once number reaches 1, returns count of steps in sequence
        integer*16 :: i
        val = 0
        do while (i /= 1)
                if (mod(i, 2) == 0) then
                        i = i / 2
                else
                        i = i * 3
                        i = i + 1
                endif
                val = val + 1
               
        end do        
        end function collatz
