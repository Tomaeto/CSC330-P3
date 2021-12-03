      program collatzIt
      !Program for iteravely computing 10 smallest ints w/ largest
      ! Collatz sequences less than 5 billion
        
      !Variable declarations
     
        !Variables for loop pointers, storing value to perform Collatz
        ! formula on, and pointer for arrays
        integer*16 ::i, j, upper, collVal, ptr
        integer*16 :: collatz
        !Arrays for storing sets of Collatz sequence lengths and initial
        ! values
        !Arrays filled w/ zeros by default
        integer, dimension(10) :: lengths, tempLengths
        integer*16, dimension(10) :: vals, tempVals
        !Variable for storing Collatz sequence length of a given value
        integer :: length
         
        !Getting user input for upper bound
        write (*, fmt = "(a)", advance = "no") "Enter upper bound: "
        read *, upper        
       
        !Loop for computing Collatz sequence length for each value in
        ! range and building arrays of smallest values w/ longest
        ! sequences
        outer: do i = 1, upper

                !Getting Collatz sequence length of current value
                collVal = i
                length = collatz(collVal)

                !Adding length to array if length is greater than any
                ! length in array and cycling outer loop
                do j = 1, 10
                        ptr = j
                        if (length > lengths(ptr)) then
                                lengths(ptr) = length
                                tempLengths(ptr) = length
                                vals(ptr) = i
                                tempVals(ptr) = i
                                cycle outer

                        !If length is equal to length in array, adding
                        ! to array if initial value is smaller and
                        ! cycling outer loop 
                        else if (length == lengths(ptr)) then
                                if (i < vals(ptr)) then
                                        lengths(ptr) = length
                                        tempLengths(ptr) = length
                                        vals(ptr) = i
                                        tempVals(ptr) = i  
                                endif
                                cycle outer
                        endif
                end do
        end do outer

        !Printing lengths and corresponding initial values in order of
        ! sequence length
        !Lengths array stores values in descending order, so loop
        ! through in reverse order prints out values in ascending order
        print *, "Collatz sequence lengths in ascending order: "
        do i = 10, 1, -1
                do j = 1, 10
                        if (lengths(j) == tempLengths(i)) then
              write(*, fmt = "(i0, a)", advance = "no") vals(j), "     "
              write(*, fmt = "(i0)", advance = "yes") lengths(j)
                        endif
                end do
        end do

        !Sorting tempVals array in ascending order
        call sort(tempVals)

        !Printing lengths and corresponding initial values in order of
        ! initial value size
        print *, "Collatz sequence lengths in order of initial value: "
        do i = 1, 10
                do j = 1, 10
                        if (vals(j) == tempVals(i)) then
              write(*, fmt = "(i0, a)", advance = "no") vals(j), "     "
              write(*, fmt = "(i0)", advance = "yes") lengths(j)
                        endif
                end do
        end do
        
      end program collatzIt

      integer*16 function collatz( i ) result (counter)
      !Iterative version of Collatz function for counting steps of
      ! Collatz sequence
      !Precondition: Main program passes in integer value
      !Postcondition: Returns length of Collatz sequence of value

        integer*16 :: i
        counter = 0

        !While input value is not 1, perform Collatz formula and
        ! increment counter 
        do while (i /= 1)
                if (mod(i, 2) == 0) then
                        i = i / 2
                else
                        i = i * 3
                        i = i + 1
                endif
                counter = counter + 1
               
        end do        
        end function collatz

        subroutine sort(arr)
        !Subroutine for sorting array of 10 16-bit integer values
        !Performs insertion sort on array
                integer :: i, j
                integer*16, dimension(10) :: arr
                integer*16 :: x
                
                do i = 2, 10
                        x = arr(i)
                        j = i - 1
                        do while (j >= 1)
                                if (arr(j) <= x) exit
                                arr(j + 1) = arr(j)
                                j = j - 1
                        end do
                        arr(j + 1) = x
                end do
        end subroutine
