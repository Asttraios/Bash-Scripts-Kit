#!/bin/bash

#DZIELENIE 
divide() {
    if [ $(( $1 - $2 )) -ne 0 ]; then
        echo $[ ($1 + $2) / ($1 - $2) ]
    else
        echo "Blad- dzielenie przez 0"
        exit 1
    fi
}

#SILNIA ITERACYJNA
silniaIter() {
    local result=1
    if [ $# -ne 1 ] || [ $1 -lt 0 ]; then
        echo "Blad - podaj jedną liczbe naturalna"
        exit 1
    fi
    for (( counter = 1; counter <= $1; counter++ )); do
        result=$(( result * counter ))
    done
    echo $result
}

#SILNIA REKURENCYJNA
silniaRek() {
    if [ $1 -lt 0 ]; then
        echo "Blad - liczba nie moze byc ujemna"
        exit 1
    elif [ $1 -eq 0 ] || [ $1 -eq 1 ]; then
        echo 1
    else
        local last=$(silniaRek $(( $1 - 1 )))
        echo $(( $1 * last ))
    fi
}

#SUMA
suma() {
    local result=0
    for number in "$@"; do
        result=$(( result + number ))
    done
    echo $result
}

# Pobieranie wartosci od uzytkownika
echo "(a+b)/(a-b) Podaj a i b (po spacji): "
read a b
echo "Wynik: $(divide $a $b)"

echo "Silnia (iteracyjnie) - Podaj liczbe naturalna: "
read c
echo "Wynik: $(silniaIter $c)"

echo "Silnia (rekurencyjnie) - Podaj liczbe naturalna: "
read d
echo "Wynik: $(silniaRek $d)"

echo "Suma - Podaj liczby (po spacji): "
read -a numbers
echo "Wynik: $(suma "${numbers[@]}")"
