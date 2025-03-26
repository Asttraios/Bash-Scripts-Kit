#Z5
#!/bin/bash

search_file="$1"
#1
grep -i -E -P '(?<=\n[[:space:]]+)?^[^+-]0x[0-9A-F](?<=[[:space:]]+)' $search_file
#2
grep -P -o '((?<=[[:space]] | ^))[a-zA-Z0-9\.\,\;\:]+@[0-9a-zA-Z\.\-]+\.[0-9a-zA-Z]+' $search_file

#3
grep -P -o '((?<=[[:space]]^)[\+\-]*[0-9]*\.[0-9]+(?<!\.))' $search_file

