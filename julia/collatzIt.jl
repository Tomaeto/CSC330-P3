#!/usr/bin/julia

#Program for iteravely calculating the 10 smallest ints with 
#the longest Collatz sequences less than 5 billion

#Precondition: Integer value is passed in from main function
#Postconditon: Returns length of Collatz sequence of input value
function collatz(i) :: Int32

	#Iteravely runs Collatz formula until input reaches 1

	#Variable for counting steps in Collatz sequence
	counter :: Int32 = 0

	#While input is not 1, run Collatz formula and increment counter
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

#Main driver code
function main()

	#Arrays for storing Collatz sequence lengths and corresponding initial values
	vals = UInt64[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	lengths = Int32[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

	#Variable for storing Collatz sequence length of each value in range
	length :: Int32 = 0

	#Getting user input for upper bound of range
	upper :: UInt64 = 0
	print("Enter upper bound: ")
	num = readline()
	upper = parse(UInt64, num)
	
	#Temp arrays for storing sorted sets of lengths and initial values
	tempLengths = Int32[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	tempVals = UInt64[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]	

	#Loop for computing Collatz sequence of each value in given range and building
	#	array of smallest values w/ longest sequences
	for i in 1:upper

		#Storing Collatz sequence length of current value
		length = collatz(i)

		#Loop for checking if current length fits in array
		for j in 1:10

			#Adding Collatz sequence length and corresponding intial value if
			#	length is greater than any length in array and breaking loop
			if (length > lengths[j])
				lengths[j] = length
				tempLengths[j] = length
				vals[j] = i
				tempVals[j] = i
				break

			#If length is equal to a length in the array, stores length and initial value if
			#	the current initial value is smaller than the stored value, and breaking loop
			elseif (length == lengths[j])
				if (i < vals[j])
					lengths[j] = length
					tempLengths[j] = length
					vals[j] = i
					tempVals[j] = i
				end
				break
			end	
		end
	end
	
	#Sorting temp arrays
	sort!(tempLengths)
	sort!(tempVals)

	#Printing lengths in ascending order
	println("Collatz sequence lengths in ascending order: ")
	for i in 1:10
		for j in 1:10
			if (lengths[j] == tempLengths[i])
				println(vals[j], "\t", lengths[j])
			end
		end
	end

	#Printing lengths in ascending order based on initial values
	println("Collatz sequence lengths in order of initial values: ")
	for i in 1:10
		for j in 1:10
			if (vals[j] == tempVals[i])
				println(vals[j], "\t", lengths[j])
			end
		end
	end
end

#Running main driver code
main()
