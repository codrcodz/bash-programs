#!/bin/bash
# Extension Namer v2015.07.28.02
# Author: Cody Lee Cochran
# Contributer(s): Chris Derichs
# MIT License

extension=$1

position_=( ${extension:0:1} ${extension:1:1} ${extension:2:1} ${extension:3:1} )
ltr_set_=( 0 1 a:b:c d:e:f g:h:i j:k:l m:n:o p:q:r:s t:u:v w:x:y:z )

for digit in ${position_[*]}
	do 
		case $digit in
#				[0-1])
#					echo "Extension character $digit invalid; exiting."
#					exit 1
#					;;
				[0-9]) 
					ltr_stack+="${ltr_set_[$digit]}/"
					;;
				*)
					echo "Extension character $digit invalid; exiting."
					exit 1
					;;
		esac
	done

for i0 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d1//:/\n}\n"; done; unset IFS)
		do for i1 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d2//:/\n}\n"; done; unset IFS)
			 do for i2 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d3//:/\n}\n"; done; unset IFS)
		 		do for i3 in $(IFS=/; echo "${ltr_stack}" | while read d{1..4}; do printf "${d4//:/\n}\n"; done; unset IFS)
		 			do printf "${i0}${i1}${i2}${i3}\n"
					done
				done
			done
		done #|

#while read line
	#do egrep -i "^$line$" /usr/share/dict/words
#done

unset extension
unset position_
unset ltr_set_
unset ltr_stack