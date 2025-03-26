#!/bin/bash

txt_file_path="$1"  # First argument: path to the text file
key_word="$2"       # Second argument: keyword to search for

file -i $txt_file_path  # Display file type and MIME format

wc -l $txt_file_path  # Count the number of lines in the file

du -h $txt_file_path  # Show disk usage in a human-readable format

grep -o $key_word $txt_file_path | wc -l  # Count occurrences of the keyword (each match on a new line)
grep -v $key_word $txt_file_path | wc -l  # Count the number of lines that do NOT contain the keyword

cat -n $txt_file_path | head -n 5 | tail -n 1  # Display the 5th line of the file (extract the last one from the first 5)
