#!/bin/bash

# ITERATIVE FACTORIAL
factorialIter() {
    local result=1
    if [ $# -ne 1 ] || [ $1 -lt 0 ]; then
        echo "Error. Provide a single natural number"
        exit 1
    fi
    for (( counter = 1; counter <= $1; counter++ )); do
        result=$(( result * counter ))
    done
    echo $result
}

# RECURSIVE FACTORIAL
factorialRec() {
    if [ $1 -lt 0 ]; then
        echo "Error. The number can't be negative"
        exit 1
    elif [ $1 -eq 0 ] || [ $1 -eq 1 ]; then
        echo 1
    else
        local last=$(factorialRec $(( $1 - 1 )))
        echo $(( $1 * last ))
    fi
}

echo "Factorial (iterative) - Enter a natural number: "
read c
echo "Result: $(factorialIter $c)"

echo "Factorial (recursive) - Enter a natural number: "
read d
echo "Result: $(factorialRec $d)"