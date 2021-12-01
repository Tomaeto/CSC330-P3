package main

import "fmt"
//Program for recursively computing the 10 smallest ints with 
//	the longest Collatz sequences less than 5 billion

func collatz(i uint32) uint32 {
	//Function for recursively computing length of Collatz sequence of input val
	//If val is even, divides by 2
	//If val is odd, multiplies by 3 and adds 1
	//Finally, val will equal 1 and function returns length of sequence

	var count uint32 = 1
	if (i == 1) {
		count = 0
	} else if (i % 2 == 0) {
		i = i / 2
		count = count + collatz(i)
	} else { 
		i = i * 3 + 1
		count = count + collatz(i)
	}
		
	return count
}

func main() {
	//Testing recursive Collatz function
	var i uint32 = 77031
	fmt.Println(collatz(i))
}
