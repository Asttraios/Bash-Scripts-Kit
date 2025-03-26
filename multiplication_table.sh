#!/bin/bash

#Creating multiplication table
multi_table() {
    if [[ $1 -le 0 || $2 -le 0 ]]; then
        echo "Error. Numbers must be positive"
        exit 1
    fi

    local rows=$1
    local cols=$2

    echo "Multiplication table (${rows}x${cols}):"
    for ((i = 1; i <= rows; i++)); do
        for ((j = 1; j <= cols; j++)); do
            printf "%4d" $((i * j))  
        done
        echo
    done
}

echo "Multiplication table - Provide number of rows and columns (after space): "
read a b
echo "$(multi_table $a $b)"