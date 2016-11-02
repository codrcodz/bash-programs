#!/bin/bash
# Program: namer.sh v2016.10.30.01
# Author: Cody Lee Cochran
# Contributer(s): Chris Derichs
# License: MIT License
# Description: This is a toy program that makes use of some of the bash programming language's less known features.
# When provided with your four digit phone extension, the program will return a list of all possible letter combinations.
# Special thanks to Chris for helping me shrink down the case statement.

# The program takes your four digit phone extension as an argument in the $1 position when invoked from the command line.
extension=$1

# The extension is then carved up into four pieces, each in it's own spot within the "position" array.
position_=( ${extension:0:1} ${extension:1:1} ${extension:2:1} ${extension:3:1} )

# The digit-to-character translation is performed with an array called "ltr_set_"
ltr_set_=( 0 1 a:b:c d:e:f g:h:i j:k:l m:n:o p:q:r:s t:u:v w:x:y:z )

# In this loop, each number stored in the "position_" array is passed to a case evaluation.
for digit in ${position_[*]}
	do 
    		# The case eval looks at the digit and decides if it has cooresponding letters (0 & 1 do not).
    		# If the digit is 2-9, the associated letters are added to the "/" delimited "ltr_stack" variable.
		case $digit in
			[0-1])
				echo "Extension character $digit invalid; exiting."
				exit 1
				;;
			[2-9]) 
				ltr_stack+="${ltr_set_[$digit]}/"
				;;
			*)
				echo "Extension character $digit invalid; exiting."
				exit 1
				;;
		esac
	done

# Now the "ltr_stack" variable will have a list of letters delimited by ":" and "/" symbols
# For example: 2345 would be stored as: a:b:c/d:e:f/g:h:i/j:k:l
# The series of nested loops below manipulates the "Interfield Seperator (IFS)" reserved variable in Bash.
# By setting/unsetting it, the delimiter used by the while loops can be changed.
# This allows for the "/" and ":" symbols in the "ltr_stack" variable to be used as delimiters instead of "/n"
# The "ltr_stack" variable is carved into pieces and the letters are printed in sets of four as the loop iterates.
# The "i0" - "i4" arrays isolate and store each letter set from each of the four digits, eliminating the "/" delimiter.
# The "d1" - "d4" arrays associated with each "i" variable are used to strip the ":" delimiters out of the letter sets.
# For instance, after the stripping process, the values of the i0 array might be: i0[0]=a, i0[1]=b, i0[2]=c, et cetera.
# Once each letter set is assigned to an "i" array, the for loop iteriates over each array, printing a new letter each time.
# So, on the first pass of this loop, you'll get the values of: i0[0], i1[0], i2[0], and i3[0], all mashed together (i.e. adgj).
# On the second pass, you'd get the values of: i0[0], i1[0], i2[0], i3[1], aka "adgk" if our extension was "2345". 
# Eventually, every possible combination of letters translated from the four provided digits is printed in sets of four.
for i0 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d1//:/\n}\n"; done; unset IFS)
	do for i1 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d2//:/\n}\n"; done; unset IFS)
		 do for i2 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d3//:/\n}\n"; done; unset IFS)
	 		do for i3 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d4//:/\n}\n"; done; unset IFS)
	 			do printf "${i0}${i1}${i2}${i3}\n"
				done
			done
		done
	done

# Lastly, we cleanup after ourselves by unsetting everything in case we run the script again from the same env.
unset extension
unset position_
unset ltr_set_
unset ltr_stack
