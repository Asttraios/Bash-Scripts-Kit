#!/bin/bash


#Bubble Sort
bubble_sort(){

	declare -a bubbleArray
	
	
	for elem in $@
	do
		bubbleArray+=($elem)
	done
	
	#echo $(( $# - 1 ))

	#echo "${bubbleArray[2]}"

	for ((i = 0; i <= $# - 1; i++));
	do
		for ((j = 0; j <= $# - 1; j++ ));
		do 
			if [[ ${bubbleArray[j]} -gt ${bubbleArray[j+1]} ]];
			then
				temp=${bubbleArray[j]}
				bubbleArray[j]=${bubbleArray[j+1]}
				bubbleArray[j+1]=$temp
			fi
		done
	done

	echo ${bubbleArray[@]}
}

# Reading values from the user
echo "Bubble sort - provide numbers(after space): "
read -a numbers1
echo "Result: $(bubble_sort "${numbers1[@]}")"