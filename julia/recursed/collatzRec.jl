#!/usr/bin/julia

#Program for recursively calculating the 10 smallest ints with 
#the longest Collatz sequences less than 5 billion


function collatz(i) :: UInt32
	#Function for recursively finding the length of an input int's Collatz sequence
	#If input is not 1, runs Collatz formula and recursively calls func to increment counter
	#Once input val is 1, breaks recursion and returns length of Collatz sequence

	counter :: UInt32 = 1
	if (i == 1)
		counter = 0
	elseif (i % 2 == 0)
		i = i / 2
		counter = counter + collatz(i)
	else
		i = i * 3 + 1
		counter = counter + collatz(i)
	end
	return counter
end

#Testing recursive Collatz function
println(collatz(77031))
