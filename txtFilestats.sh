#!/bin/bash

txt_file_path="$1"
key_word="$2"

file -i $txt_file_path	# FILE TYPE + MIME FORMAT

wc -l $txt_file_path	# NUMBER OF LINES IN THE FILE

du -h $txt_file_path	# DISK USAGE + HUMAN READABLE

grep -o $key_word $txt_file_path | wc -l	# GREP -O PRINT ONLY MATCHED PARTS OF A MATHING LINE
grep -vo $key_word $txt_file_path | wc -l	# GREP -v SELECT NON MATCHING LINES
cat -n $txt_file_path | head -n 5 | tail -n 1 # DISPLAY 5 FIRST LINES AND LAST ONE LINE
