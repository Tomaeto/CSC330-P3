package main

import "fmt"
//Program for iteravely computing the 10 smallest ints with 
//	the longest Collatz sequences less than 5 billion

func collatz(i uint32) uint32 {
	//Function for iteravely computing length of Collatz sequence of input val
	//If val is even, divides by 2
	//If val is odd, multiplies by 3 and adds 1
	//Finally, val will equal 1 and function returns length of sequence
	var count uint32 = 0
	for (i != 1){
		if (i % 2 == 0) {
			i = i / 2
		
		} else { 
			i = i * 3 + 1
		}
		count = count + 1
	
	}
	return count
}

func main() {
	//Testing iterative Collatz function
	var i uint32 = 77031
	fmt.Println(collatz(i))
}
