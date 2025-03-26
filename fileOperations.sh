#!/bin/bash


rnd_devide(){

	#PLIK ZRODLOWY, I DWA DOCELOWE
	local source="$1"	
	local dest1="$2"
	local dest2="$3"
	
	# SPRAWDZENIE CZY MOZNA ODCZYTAC PLIK ZRODLOWY
	if [ ! -r $source ]
	then
		echo "Blad. Nie mozna odczytac pliku - sprawdz czy masz uprawnienia"
		exit -1
	fi

	# SPRAWDZENIE CZY PIERWSZY PLIK DOCELOWY ISTNIEJE - JESLI NIE TO GO STWORZ
	if [ ! -e $dest1 ]
	then
		touch $dest1
	else
		>$dest1
	fi
	
	
	# SPRAWDZENIE CZY DRUGI PLIK DOCELOWY ISTNIEJE - JESLI NIE TO GO STWORZ
	if [ ! -e $dest2 ]
	then
		touch $dest2
	else
		>$dest2
	fi

	if [ ! -w $dest1 ] && [ ! -w $dest2 ]
	then
		echo "Blad. Nie masz uprawnien do zapisu do plikow wyjsciowych"
	fi

	
	while IFS= read -r line
	do
		if [ $((RANDOM % 2)) -eq 0 ]
		then
			echo $line >> $dest1
		else
			echo $line >> $dest2
		fi
	done < $source
	
	echo "Finished"

}


catalogs(){

	local main_catalog="$1"
	local catalog_list="$2"

	if [ ! -d $main_catalog ]
	then
		echo "Sciezka nie wskazuje na katalog"
		exit -1
	fi

	if [ ! -w $main_catalog ]
	then
		echo "Brak uprawnien do zapisu"
		 exit -1
	fi

	if [ ! -r $catalog_list ]
	then
		echo "Blad. Nie mozna odczytac pliku"
		exit -1
	fi

	
	while IFS= read -r directory || [[ -n "$directory" ]]
	do
		directory_path=$main_catalog/$directory

		mkdir -p $directory_path

		for ((i=0; i<10; i++))
		do
			touch $directory_path/F$i.txt
		done
	done < $catalog_list

	
	echo "Finished"
}

echo "Losowy podzial linijek miedzy pliki."
echo "Podaj po spacjach: Plik zrodlowy, pierwszy i drugi plik docelowy: "
read source dest1 dest2
rnd_devide "$source" "$dest1" "$dest2"

echo "Tworzenie 10 plikow tekstowych w katalogach podanych w liscie."
echo "Podaj glowny katalog oraz plik z lista podkatalogow (po spacji): "
read main_dir dir_list
catalogs "$main_dir" "$dir_list"