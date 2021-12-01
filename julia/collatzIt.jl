#!/usr/bin/julia

#Program for iteravely calculating the 10 smallest ints with 
#the longest Collatz sequences less than 5 billion


function collatz(i) :: UInt32
	#Function for iteravely finding the length of an input int's Collatz sequence
	#While the input i is not 1, runs Collatz formula and increments counter
	#Finally, i will be 1, and func returns length of Collatz sequence
	counter :: UInt32 = 0
	while (i != 1)
		if (i % 2 == 0)
			i = i / 2
		else
			i = i * 3 + 1
		end
		counter = counter + 1
	end
	return counter
end

#Testing iterative Collats function
println(collatz(77031))
