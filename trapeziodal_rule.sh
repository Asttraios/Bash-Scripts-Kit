#!/bin/bash

#TRAPEZOIDAL RULE
numerical_integration() {
    table=("$@")		# Number of function's values
    
    n=${#table[@]}
    height=1			# constant Height of a trapezoid
    sum=0

    for ((i=1; i<n; i++)); do
        low_base="${table[i-1]}"	# Upper base of trapezoid
        up_base="${table[i]}"	# bottom base of trapezoid

        surface_area=$((height * (low_base + up_base)) / 2 )  # trapezoid surface_area 
        sum=$((sum + surface_area))	# total sum of surface areas 
    done

    echo "Result: $sum"
}

echo "Definite Integral- Trapezoidal rule. Provide the values of a function you want to integrate (after spaces) : "
read -a numbers2
echo "Result: $(numerical_integration "${numbers2[@]}")"