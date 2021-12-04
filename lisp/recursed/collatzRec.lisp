#!/usr/bin/sbcl --script

(defvar counter)
(defun collatz (i)
	(setq counter 1)
	(cond ((= i 1)
		(setq counter 0))
		( (= (mod i 2) 0)
		(setq i (/ i 2))
		(setq counter (+ counter (collatz i))))
		( (/= (mod i 2) 0)
		(setq i (+ (* i 3) 1))
		(setq counter (+ counter (collatz i)))))
	(return-from collatz counter))

(print (collatz 97))		
