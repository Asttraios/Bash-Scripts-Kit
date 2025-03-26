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

#TWORZENIE TABLICZKI MNOZENIA
mnozenie() {
    if [[ $1 -le 0 || $2 -le 0 ]]; then
        echo "Błąd: Argumenty muszą być dodatnie"
        exit 1
    fi

    local rows=$1
    local cols=$2

    echo "Tabliczka mnożenia (${rows}x${cols}):"
    for ((i = 1; i <= rows; i++)); do
        for ((j = 1; j <= cols; j++)); do
            printf "%4d" $((i * j))  
        done
        echo
    done
}

#CALKOWANIE - MERTODA TRAPEZOW
numerical_integration() {
    tablica=("$@")		# WARTOSCI FUNKCJI KTOREJ CALKE CHCEMY OBLICZYC
    
    n=${#tablica[@]}
    wysokosc=1			#WYSOKOSC TRAPEZU - STALA ODLEGLOSC PUNKTOW NA OSI X
    suma=0

    for ((i=1; i<n; i++)); do
        dol="${tablica[i-1]}"	# GORNA (LEWA) PODSTAWA TRAPEZU
        gora="${tablica[i]}"	# DOLNA (PRAWA) PODSTAWA TRAPEZU

        pole=$((wysokosc * (dol + gora)))  # POLE TRAPEZU
        suma=$((suma + pole))	# SUMOWANIE KOLEJNYCH POL TRAPEZU
    done

    echo "Wynik calkowania: $suma"
}


# Pobieranie wartosci od uzytkownika
echo "Bubble sort - Podaj liczby(po spacji): "
read -a numbers1
echo "Wynik: $(bubble_sort "${numbers1[@]}")"

echo "Tabliczka mnozenia - Podaj dlugosc rzedu i kolumny (po spacji): "
read a b
echo "$(mnozenie $a $b)"

echo "Calka - metoda trapezow - : "
read -a numbers2
echo "Wynik: $(numerical_integration "${numbers2[@]}")"
