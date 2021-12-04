package main

import "fmt"
import "sort"

//Program for recursively computing the 10 smallest ints with 
//	the longest Collatz sequences less than 5 billion

//Precondition: integer value is passed in from main function
//Postcondition: Returns length of Collatz sequence of input value
func collatz(i uint64) int {

	//Variable for storing length of Collatz sequence
	var count int = 1

	//Recursively calls Collatz function until input value reaches 1
	if (i == 1) {
		count = 0

	//If input value is not 1, performs Collatz formula and recursively calls function
	} else if (i % 2 == 0) {
		i = i / 2
		count = count + collatz(i)
	} else {
		i = (i * 3) + 1
		count = count + collatz(i)
	}

	return count	
}

func main() {
	//Arrays for storing Collatz sequence lengths and corresponding initial values, initialized to 0
	var lengths = []int{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	var vals = []uint64{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

	//Variable for storing the Collatz sequence length of each value in range
	var length int = 0

	//Getting user input for upper bound
	var upper uint64
	fmt.Print("Enter upper bound: ")
	fmt.Scan(&upper)

	//Loop for computing the Collatz sequence for every value b/w 1 and user input upper bound and building array
	//	of smallest values with longest Collatz sequences
	//Postcondition: Each array will hold 10 longest unique Collatz sequences and corresponding starting values
	for i := uint64(1); i <= upper; i++ {

		//Storing Collatz sequence length for current value
		length = collatz(i)
		
		//Loop for checking if current Collatz length fits into array
		for j := 0; j < 10; j++ {

			//Adding Collatz length and corresponding starting value to each array if length
			//	is greater than any length in array and breaking loop
			if length > lengths[j] {
				lengths[j] = length
				vals[j] = i
				break;

			//If lengths are equal, adds current length if starting value is smaller, and breaks loop
			} else if length == lengths[j] {
				if i < vals[j] {
					lengths[j] = length
					vals[j] = i
				}
				break;
			}
		}
	}
	
	//Arrays for storing sorted lengths and initial values 
	var tempVals = []uint64{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	var tempLengths = []int{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

	//Filling temp arrays with corresponding values from original arrays
	for i := 0; i < 10; i++ {
		tempVals[i] = vals[i]
		tempLengths[i] = lengths[i]
	}
	
	//Sorting tempLengths array and printing lengths in sorted order
	sort.Ints(tempLengths)
	fmt.Println("Collatz sequence lengths in ascending order: ")
	fmt.Println("Intial value\tSequence length")
	for i := 0; i < 10; i++ {
		for j := 0; j < 10; j++ {
			if lengths[j] == tempLengths[i] {
				fmt.Println("  ", vals[j], "\t\t", lengths[j])
			}
		}
	}

	//Sorting tempVals array and printing lengths in order of sorted vals
	sort.Slice(tempVals, func(i, j int) bool {return tempVals[i] < tempVals[j]})
	fmt.Println("Collatz sequence lengths in order of intial values: ")
	fmt.Println("Intial value\tSequence length")
	//Loop for finding index of length corresponding to sorted initial values
	//Compares sorted values to unsorted array, and prints length of index where they are equal
	for i := 0; i < 10; i++ {
		for j := 0; j < 10; j++ {
			if vals[j] == tempVals[i] {
				fmt.Println("  ", vals[j], "\t\t", lengths[j])
			}
		}
	}
}
