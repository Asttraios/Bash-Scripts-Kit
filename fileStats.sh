#!/bin/bash

statistic() {
    local source="$1"
    local stat_file="$2"

    # CHECK IF THE SOURCE FILE EXISTS AND HAS READ PERMISSIONS
    if [ ! -e "$source" ] || [ ! -r "$source" ]; then
        echo "Error: Source file does not exist or does not have permissions."
        exit 1
    fi

    # CHECK IF THE STATISTICS FILE EXISTS
    if [ ! -e "$stat_file" ]; then
        touch "$stat_file"
    fi

    # CHECK IF THERE ARE WRITE PERMISSIONS FOR THE STATISTICS FILE
    if [ ! -w "$stat_file" ]; then
        echo "Error: No write permissions for the output file."
        exit 1
    fi

    declare -A word_count

    # REMOVE PUNCTUATION AND READ WORDS
    tr -d '[:punct:]' < "$source" | while IFS=' ' read -r -a words; do
        for word in "${words[@]}"; do   # ITERATE THROUGH ALL WORDS
            if [[ -n "$word" ]]; then   # CHECK IF VARIABLE IS NOT EMPTY
                ((word_count["$word"]++))  # COUNT WORD OCCURRENCES
            fi
        done
    done

    # SORT AND SAVE TO FILE
    for word in "${!word_count[@]}"; do
        echo "$word ${word_count[$word]}"
    done | sort -k2,2nr > "$stat_file"  # k2 - SORT BY SECOND COLUMN, 2NR - NUMERIC DESCENDING SORT

    echo "Finished. Statistics saved."
}

echo "Enter the file to analyze and the output file (space-separated): "
read src_file dest_file
statistic "$src_file" "$dest_file"
