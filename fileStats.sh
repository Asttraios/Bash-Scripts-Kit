#!/bin/bash

statistic() {
    local source="$1"
    local stat_file="$2"

    # CZY PLIK ZRODLOWY ISTNIEJE/SA UPRAWNIENIIA
    if [ ! -e "$source" ] || [ ! -r "$source" ]; then
        echo "Blad: Brak pliku zródlowego lub brak uprawnien do odczytu."
        exit 1
    fi

    # CZY PLIK ZE STATYSTYKAMI ISTNIEJE
    if [ ! -e "$stat_file" ]; then
        touch "$stat_file"
    fi

    # CZY SA UPRAWNIENIIA DO ZAPISU DO PLIKU ZE STATYSTYKAMI
    if [ ! -w "$stat_file" ]; then
        echo "Blad: Brak uprawnien do zapisu w pliku wyjsciowym."
        exit 1
    fi

    declare -A word_count

    
    tr -d '[:punct:]' < "$source" | while IFS=' ' read -r -a words; do	#USUNIECIE ZANKOW INTERPUNKCYJNYCH
        for word in "${words[@]}"; do		#ITERACJA PO WSZYSTKICH SLOWACH
            if [[ -n "$word" ]]; then  		# CZY ZMIENNA NIE JEST PUSTA
                ((word_count["$word"]++))	# LICZBA WYSTAPIEN KONKRETNYCH SLOW
            fi
        done
    done

    # SORTOWANIE I ZAPIS
    for word in "${!word_count[@]}"; do
        echo "$word ${word_count[$word]}"
    done | sort -k2,2nr > "$stat_file"		# k2 - SORTOWANIE WG DRUGIEJ KOLUMNY, 2NR - SORTOWANIE NUMERYCZNE MALEJACE

    echo "Finished. Statystyki zapisane"
}

echo "Podaj plik do analizy oraz plik docelowy z wynikiem (po spacji): "
read src_file dest_file
statistic "$src_file" "$dest_file"



