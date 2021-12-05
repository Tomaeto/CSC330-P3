#!/usr/bin/sbcl --script
;;Program for recursively calculating 10 smallest ints w/ the largest
;;	Collatz sequences less than 5 billion

;;Variable for counting length of Collatz sequence of given value
(defvar counter)

;;Precondition: Main function passes in integer value
;;Postcondition: Returns length of Collatz sequence of input value
(defun collatz (val)

	;;Recursively runs Collatz formula until input value reaches 1

	;;If input is not 1, runs Collatz formula and recursively increments counter
	(setq counter 1)
	
	(cond ((= val 1)
		(setq counter 0))
	( ( = (mod val 2) 0)
		(setq val (/ val 2))
		(setq counter (+ counter (collatz val))))
	( (/= (mod val 2) 0)
		(setq val (+ (* val 3) 1))
		(setq counter (+ counter (collatz val)))))

	;;Returning count of steps in Collatz sequence
	(return-from collatz counter))


;;Main driver code

;;Getting user input for upper bound of range
(defvar upper)
(write-string "Enter upper bound: ")
(finish-output)
(setq upper (read))

;;Creating arrays to store Collatz sequence lengths and corresponding initial values
;;Temp arrays used for sorting values for output
(defvar vals)
(defvar tempVals)
(defvar lengths)
(defvar tempLengths)
(setf vals (make-array '(10) :initial-element 0))
(setf tempVals(make-array '(10) :initial-element 0))
(setf lengths (make-array '(10) :initial-element 0))
(setf tempLengths (make-array '(10) :initial-element 0))

;;Variable for storing length of Collatz sequence of given value
(defvar len)

;;Loop for computing Collatz sequence lengths of each value in range and building
;;	array of smallest values w/ longest sequence lengths
(loop for i from 1 to upper doing
	(progn	

	;;Storing Collatz sequence length of current value
	 (setf len (collatz i))

	;;Loop for checking if current length fits in array
	 (loop for j from 0 to 9 doing
		(progn

		;;Adding length and corresponding initial value if
		;;	length is greater than any length in array
		 (cond ((> len (aref lengths j))
			(setf (aref lengths j) len)
			(setf (aref tempLengths j) len)
			(setf (aref vals j) i)
			(setf (aref tempVals j) i)				
			(return))
			
		;;If length is equal to length in array, replace length if current initial value
		;;	is smaller than stored initial value
		((= len (aref lengths j))
			(progn
			(if (< i (aref vals j))
			       (progn
				(setf (aref lengths j) len)
				(setf (aref tempLengths j) len)
				(setf (aref vals j) i)
				(setf (aref tempVals j) i)))
				(return))))))))

	;;Sorting temp arrays
	(sort tempVals #'<)
	(sort tempLengths #'<)			
	
	;;Printing lengths and corresponding initial values in ascending order
	;;	of sequence lengths
	(princ "Collatz sequence lengths sorted in ascending order: ")
	(terpri)
	(princ "Initial value     Sequence length")
	(terpri)
	(loop for i from 0 to 9 doing
		(loop for j from 0 to 9 doing
			(if (= (aref lengths j) (aref tempLengths i))
				(progn
				 (princ "  ")
				 (write (aref vals j))
				 (princ "             ")
				 (write (aref lengths j))
			         (terpri)))))

	;;Printing lengths and corresponding intial values in ascending order
	;;	of initial values
	(princ "Collatz sequence lengths sorted in order of initial values: ")
	(terpri)
	(princ "Initial value     Sequence length")
	(terpri)
	(loop for i from 0 to 9 doing
		(loop for j from 0 to 9 doing
			(if (= (aref vals j) (aref tempVals i))
				(progn
				 (princ "  ")
				 (write (aref vals j))
				 (princ "             ")
				 (write (aref lengths j))
				 (terpri)))))
