#!/usr/bin/sbcl --script

(defvar counter)
(defun collatz (val)
	(setq counter 0)
	(loop
	     (progn
	          (if (= (mod val 2) 0)
		       (setq val (/ val 2))
		       (setq val (+ (* val 3) 1)))
	     (incf counter))
	(when (= val 1) (return val)))
	(return-from collatz counter))

