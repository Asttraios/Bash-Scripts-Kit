#!/bin/bash

rnd_divide() {

    # SOURCE FILE AND TWO DESTINATION FILES
    local source="$1"    
    local dest1="$2"
    local dest2="$3"
    
    # CHECK IF THE SOURCE FILE IS READABLE
    if [ ! -r $source ]; then
        echo "Error. Can't read the file - check your permissions"
        exit -1
    fi

    # CHECK IF THE FIRST DESTINATION FILE EXISTS - IF NOT, CREATE IT
    if [ ! -e $dest1 ]; then
        touch $dest1
    else
        >$dest1
    fi
    
    # CHECK IF THE SECOND DESTINATION FILE EXISTS - IF NOT, CREATE IT
    if [ ! -e $dest2 ]; then
        touch $dest2
    else
        >$dest2
    fi

    if [ ! -w $dest1 ] && [ ! -w $dest2 ]; then
        echo "Error. You do not have write permissions for the output files"
        exit -1
    fi

    # RANDOMLY DISTRIBUTE LINES BETWEEN THE TWO FILES
    while IFS= read -r line; do
        if [ $((RANDOM % 2)) -eq 0 ]; then
            echo $line >> $dest1
        else
            echo $line >> $dest2
        fi
    done < $source
    
    echo "Finished"
}

create_catalogs() {

    local main_catalog="$1"
    local catalog_list="$2"

    if [ ! -d $main_catalog ]; then
        echo "The path does not point to a directory"
        exit -1
    fi

    if [ ! -w $main_catalog ]; then
        echo "No write permissions"
        exit -1
    fi

    if [ ! -r $catalog_list ]; then
        echo "Error. Can't read the file"
        exit -1
    fi

    # CREATE DIRECTORIES AND FILES
    while IFS= read -r directory || [[ -n "$directory" ]]; do
        directory_path=$main_catalog/$directory

        mkdir -p $directory_path

        for ((i=0; i<10; i++)); do
            touch $directory_path/F$i.txt
        done
    done < $catalog_list

    echo "Finished"
}

echo "Randomly distributing lines between files."
echo "Enter (space-separated): Source file, first destination file, second destination file: "
read source dest1 dest2
rnd_divide "$source" "$dest1" "$dest2"

echo "Creating 10 text files in directories listed in the provided file."
echo "Enter (space-separated): Main directory and the file containing the list of subdirectories: "
read main_dir dir_list
create_catalogs "$main_dir" "$dir_list"
